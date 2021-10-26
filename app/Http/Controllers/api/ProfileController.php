<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Validator;
use App\User;
use Illuminate\Support\Facades\Hash;
use Auth;
use App\UserProfileImages;
use App\UserTest;
use App\TestQues;
use DB;
use App\UserRequest;
use Illuminate\Validation\Rule;
use Twilio\Rest\Client;
use Twilio\Jwt\ClientToken;
use App\Match;
use App\ChatStatus;
use App\BlockList;
use App\ConnectRequest;
use App\ChatRequest;
use App\Like;

class ProfileController extends Controller
{   
    public function getProfile(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 

        $my_user_id = Auth::user()->id;
        $user_id   = $request->user_id; 
        $user_data = User::getFullUserById($user_id, $my_user_id);
        //print_r($user_data['profile_images']);die;

        if($user_id != $my_user_id){
            $matchDetails = Match::where(['user_id'=>$my_user_id])->where(['like_by_me'=>$user_id])->where('status',1)->select('id')->first();
            if($matchDetails){
                $match_id = $matchDetails['id'];
            }
            else{
                $matchDetails = Match::where(['user_id'=>$user_id])->where(['like_by_me'=>$my_user_id])->where('status',1)->select('id')->first();
                $match_id = $matchDetails['id'];
            }

            if($match_id){
                //checking isDeleted status
                $isDeleted = $chat_status = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$user_id])->value('isDeleted');
                $user_data['isDeleted'] = (int)$isDeleted;

                //checking deletedBy status
                $deletedBy = 0;
                $deletedDetail = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$user_id])->where(['isDeleted'=>'1'])->first();
                if($deletedDetail){
                    $deletedBy = $my_user_id;
                }
                else{
                    $deletedDetail = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$my_user_id])->where(['isDeleted'=>'1'])->first();
                    if($deletedDetail){
                        $deletedBy = $user_id;
                    }
                }
                $user_data['deletedBy'] = (int)$deletedBy;
            }
            else{
                $user_data['isDeleted'] = 0;
                $user_data['deletedBy'] = 0;
            }

            //checking Block status
            $isBlocked = 0;
            
            $check_block = BlockList::where(['user_id'=>$my_user_id])->where(['blocked_user_id'=>$user_id])->first();
            if($check_block){
                $isBlocked = 1;
            }
            $user_data['isBlocked'] = $isBlocked;

            //checking blockedBy status
            $blockedDetail = BlockList::where(['blocked_user_id'=>$my_user_id])->where(['user_id'=>$user_id])->select('user_id')->first();
            if($blockedDetail){
                $blockedBy = $blockedDetail['user_id'];
            }
            else{
                $blockedDetail = BlockList::where(['blocked_user_id'=>$user_id])->where(['user_id'=>$my_user_id])->select('user_id')->first();
                $blockedBy = $blockedDetail['user_id'];
            }

            $user_data['blockedBy'] = (int)$blockedBy;

            $received_request = ConnectRequest::where('from_user_id', $user_id)
                                ->where('to_user_id', $my_user_id)
                                ->where('status','S')
                                ->first();
            if(!$received_request){
                $received_request = ChatRequest::where('from_user_id', $user_id)
                                ->where('to_user_id', $my_user_id)
                                ->where('status','S')
                                ->first();
                if(!$received_request){
                    $received_request = Like::where('from_user_id', $user_id)
                            ->where('to_user_id', $my_user_id)
                            ->where('status',1)
                            ->first();
                    $exist2 = Like::where('from_user_id', $my_user_id)
                            ->where('to_user_id', $user_id)
                            ->first();
                    if(!$exist2){
                        if($received_request){
                            $received_request['event'] = "S_L_R";
                            $user_data['received_request'] = $received_request;
                        }
                    }
                }
                else{
                    $received_request['event'] = "S_M_R";
                    $user_data['received_request'] = $received_request;
                }
            }
            else{
                $received_request['event'] = "S_C_R";
                $user_data['received_request'] = $received_request;
            }
        }

        $gender_array = Null;
        $test_id = UserTest::where('user_id', $request->user_id)->value('id');
        if($test_id) {
            $queInfo = TestQues::QueAnsInfo($test_id, 1);
            $result = array_column($queInfo['ansInfo']->toArray(), 'ans_id');
            // echo "<pre>"; print_r($result); die;
            $gender_array  = $result;
        }


        return response()->json([
            'status' => 200,
            'data'   => $user_data,
            'f_que_ans' => $gender_array,
            'message'=> 'User Profile Info', 

        ]);
    }

    public function updateProfile(Request $request){

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];

    	$validator = Validator::make($request->all(), [
            'name'          => 'nullable|max:255',
            'age'           => 'required|numeric',
            'gender'        => 'required|in:1,2,3',
            'love_push_intention' 	=> 'nullable',
            'relationship'          => 'nullable',
            'physique'    			=> 'nullable',
           	'size' 					=> 'nullable',
            'haircolor'             => 'nullable',
            'eyecolor'              => 'nullable|max:255',
            'education' 			=> 'nullable',
            'job' 					=> 'nullable',
            'hobbies' 				=> 'nullable',
            'sexual_orientation' 	=> 'nullable|in:1,2,3',
            'aboutme'               => 'nullable',
            'religion' 				=> 'nullable',
            'language'              => 'nullable',
            'profile_image'			=> 'nullable|image|mimes:jpeg,png,jpg,gif,svg,bmp|max:2048',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 


        // $photos = count($request->images);
        // foreach(range(0, $photos) as $index) {
        //     $rules['images.' . $index] = 'image|mimes:jpeg,png,jpg,gif,svg,bmp|max:2048';
        // }

        if(!$this->_checkStringIsValid($request->name, $invalidWords) ) {
            return response()->json([
                'message'=> "Name is invalid.", 
                'status' => 400,
            ]);
        }

        if(!$this->_checkStringIsValid($request->aboutme, $invalidWords) ) {
            return response()->json([
                'message'=> "Some text is invalid.", 
                'status' => 400,
            ]);
        }


        try{
        	$user            = User::find(Auth::id());
            $user->name      = $request->name;
            $user->age       = $request->age;
            $user->gender    = $request->gender;

	        $user->love_push_intention = $request->love_push_intention;
            $user->relationship        = $request->relationship;
	        $user->physique            = $request->physique;
	        $user->size                = $request->size;
            $user->haircolor           = $request->haircolor;
	        $user->eyecolor            = $request->eyecolor;
	        $user->education           = $request->education;
            $user->job                 = $request->job;
	        $user->hobbies             = $request->hobbies;
	        $user->employer            = $request->employer;
	        $user->sexual_orientation  = $request->sexual_orientation;
            $user->aboutme             = $request->aboutme;
	        $user->religion            = $request->religion;
            $user->language            = $request->language;
	        
	        // Profile Images upload 
	        if (!file_exists(url('/profile'))) {
	            mkdir(url('/profile'), 0777, true);
	        }
	        if($request->has('profile_image')){
		        $image = $request->file('profile_image');
		        $input['imagename'] = time().'.'.$image->getClientOriginalExtension();
		        $destinationPath    = public_path('/profile');
		        $image->move($destinationPath, $input['imagename']);
		        $user->profile_image = $input['imagename'];
	        }
	        $user->save();
	            
            $user      = Auth::user();
            $user_data = User::getUserById($user->id);
            return response()->json([
                'status' => 200,
                'data'   => $user_data,
                'message'=> trans('api.user.profile_update_success'), 

            ]);
    	    //$response['status'] = 200;
    	    //$response['message'] = trans('api.user.profile_update_success');
    		// $response['profile'] = User::with('profile_images')->find(Auth::id());
    		// return $response;

    	} catch(\Exception $e){
    		$response['status'] = 400;
        	$response['message'] = $e->getMessage();
        	return $response;
    	}
    }

    public function profileImagesAdd(Request $request) {

        // Profile images upload

        

        if($request->has('images') && is_array($request->images)){
            foreach ($request->images as $k => $v) {
                $profileimages          = new UserProfileImages;
                $profileimages->user_id = Auth::id();
                $pimage                 = $v;
                $input['imagename']     = rand(99, 99999).time().'.'.$pimage->getClientOriginalExtension();
                $destinationPath        = public_path('/profile');
                $pimage->move($destinationPath, $input['imagename']);
                $profileimages->image   = $input['imagename'];
                $profileimages->save();
            }
        }

        $user = User::find(Auth::user()->id);
        $profile_image = UserProfileImages::where('user_id',Auth::user()->id)->select('image')->first();
        $user->profile_image = $profile_image->getOriginal('image');
        $user->save();

        $user = Auth::user();
        $user_data = User::getUserById($user->id);

        return response()->json([
            'status' => 200,
            'data'   => $user_data,
            'message'=> trans('api.user.profile_update_success'), 
        ]);
    }

    public function deleteProfileImage(Request $request) {

        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:user_profile_images',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 

        $delete = UserProfileImages::where('id', $request->id)->delete();

        $user = User::find(Auth::user()->id);
        $profile_image = UserProfileImages::where('user_id',Auth::user()->id)->select('image')->first();
        //$user->profile_image = null;
        $user->profile_image = $profile_image->image;
        $user->save();
        
        return response()->json([
            'status' => 200,
            'data'   => $user,
            'message'=> trans('api.user.profile_update_success'), 

        ]);

    }

    public function changePassword(Request $request){
        
        $validator = Validator::make($request->all(), [
            'old_password'      => 'required|min:6',
            'new_password'  => 'required|min:6'
            ]
        );

        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }  
        
        $old_password = $request->old_password;
    
        if (Hash::check($old_password, Auth::user()->password)) {
            $user = User::find(Auth::id());
            $user->password = Hash::make($request->new_password);
            $user->save();

            return response()->json([
                'status' => 200,
                'data'   => [],
                'message'=> trans('api.user.password_change_success'),
            ]);
        }else{
            return response()->json([
                'status' => 400,
                'message'=> trans('api.user.password_not_matched'),
            ]);
        }  
    }

    public function updateLocation(Request $request) {

        $validator = Validator::make($request->all(), [
            'user_id'  => 'required|exists:users,id',
            'address'  => 'required|max:255',
            'latitude' => 'required',
            'longitude'=> 'required',
        ]);

        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400],400);
        }

        $user_id = $request->user_id;

        $update =  User::where('id', $user_id)->update([
                                                    'address'   => $request->address,
                                                    'latitude'  => $request->latitude,
                                                    'longitude' => $request->longitude,
                                                ]);

        if($update) {
            return response()->json([
                'status'  => 200,
                'message' => trans('api.user.profile_update_success'),
                'data'    => $update 
            ],200);
        } else {
            return response()->json([
                'status' => 400,
                'message' => 'Error'
            ]);
        }

        // /location/update
        // POST
        // address, latitude, longitude 
    }

    function _checkStringIsValid($title, $invalidWords){
        $title = strtolower($title);
        $title_arr = explode(', ',$title);
        foreach ($title_arr as $key => $value) {
            foreach ($invalidWords as $key => $word) {
                if(strpos($value, $word) === false){ //if not found, do nothing
                } else{
                    return false; break 2; //found
                }
            }                
        }
        return true; //valid
    }

}
