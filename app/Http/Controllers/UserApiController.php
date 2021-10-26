<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\User;
use Illuminate\Support\Facades\Hash;
use Auth;
use App\PostAds;
use App\UserProfileImages;
use DB;
use App\UserRequest;
use App\Notification;
use App\PersonalityQuestions;
use App\PersonalityQuestionsOptions;
use App\PersonalityTest;
use Twilio\Rest\Client;
// use Twilio\Jwt\ClientToken;
use App\Feed;

class UserApiController extends Controller
{
    
    public function sendCodeOnPhone($phone){

        $verification_code = rand(1111, 9999);
        $accountSid = config('app.twilio')['TWILIO_ACCOUNT_SID'];
        $authToken  = config('app.twilio')['TWILIO_AUTH_TOKEN'];
        $appSid     = config('app.twilio')['TWILIO_APP_SID'];
        $client = new Client($accountSid, $authToken);

        try{
            // Use the client to do fun stuff like send text messages!
            $client->messages->create(
            // the number you'd like to send the message to
                $phone,
                array(
                     // A Twilio phone number you purchased at twilio.com/console
                    'from' => '+16822047258', 
                     // the body of the text message you'd like to send
                    'body' => 'Your verification code is: '.$verification_code
                )
            );

            $response['status'] = 200;
            $response['verification_code'] = $verification_code;
            return $response;
        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function sendVerificationCode(Request $request){
        $rules = [
                'user_id'   => 'required|numeric|exists:users,id',
                'phone'     => 'required'
            ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $phone = $request->phone;
        $verification_code = rand(1111, 9999);
        $accountSid = config('app.twilio')['TWILIO_ACCOUNT_SID'];
        $authToken  = config('app.twilio')['TWILIO_AUTH_TOKEN'];
        $appSid     = config('app.twilio')['TWILIO_APP_SID'];
        $client = new Client($accountSid, $authToken);
        try
        {
            // Use the client to do fun stuff like send text messages!
            $client->messages->create(
            // the number you'd like to send the message to
                $phone,
                array(
                     // A Twilio phone number you purchased at twilio.com/console
                     'from' => '+16822047258', 
                     // the body of the text message you'd like to send
                     'body' => 'Your verification code is: '.$verification_code
                )
            );

            $user = User::find($request->user_id);
            $user->verification_code = $verification_code;
            $user->save();

            $response['status'] = 200;
            $response['verification_code'] = $verification_code;
            $response['message'] = trans('api.user.otp_send_success');
            return $response;
        }
        catch (\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function verifyCode(Request $request){
        $rules = [
                'user_id' => 'required|numeric|exists:users,id',
                'verification_code'     => 'required'
            ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        try{
            $user_id = $request->user_id;
            $verification_code = $request->verification_code;
            $user = User::find($user_id);
            if($user->verification_code == trim($verification_code)){
                $user->is_phone_verify = 1;
                $user->save();

                $response['status'] = 200;
                $response['message'] = trans('api.user.phone_verify_success');
                $response['user'] = $user;
                return $response;

            }else{
                $response['status'] = 400;
                $response['message'] = trans('api.user.phone_verify_fail');
                return $response;
            }

        }catch (\Exception $e) {
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
            
        }
    }

    public function forgotPassword(Request $request){
        $rules = [
                'phone_code'   => 'required',
                'phone'     => 'required'
            ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user = User::where('phone', $request->phone)->first();
        if(!$user){
            $response['status'] = 400;
            $response['message'] = trans('api.user.user_phone_not_found');
            return $response;
        }
        $phonewithcode = $request->phone_code.$request->phone;
        $result = $this->sendCodeOnPhone($phonewithcode);
        if($result['status'] == 400){
            $response['status'] = 400;
            $response['message'] = $result['message'];
            return $response;
        }
        $user->verification_code = $result['verification_code'];
        $user->save();
        $response['status'] = 200;
        $response['verification_code'] = $result['verification_code'];
        $response['message'] = trans('api.user.otp_send_success');
        $response['id'] = $user->id;
        $response['phone_code'] = $user->phone_code;
        $response['phone'] = $user->phone;
        return $response;

    }

    public function saveForgotPassword(Request $request){
        $rules = [
            'user_id'   => 'required|numeric|exists:users,id',
            'password'    => 'required|min:6|confirmed'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        try{
            $user = User::find($request->user_id);
            $user->password = Hash::make($request->password);
            $user->save();

            $response['status'] = 200;
            $response['message'] = trans('api.user.forgot_password_success');
            return $response;

        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function register(Request $request){
    	$rules = [
                //'social_id' 	=> ['required_if:social_type,1,2,3','unique:users'],
                'address' 		=> 'required',
                'gender' 		=> 'required|in:1,2',
                'country'       => 'required',
                'city'          => 'required',
               	'latitude' 		=> 'required',
               	'longitude' 	=> 'required',
                'login_type' 	=> 'in:1,2,3,4',
                'name' 			=> 'required|max:255',
                'username' 		=> 'required|max:255|unique:users',
                'email' 		=> 'required|email|max:255|unique:users',
                'phone'         => 'required|numeric|unique:users',
                'phone_code'	=> 'required',
                'password' 		=> 'required|min:6|confirmed',
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        try {
	        $user = new User;
	        $user->name = $request->name;
	        $user->username = $request->username;
	        $user->email = $request->email;
	        $user->password = Hash::make($request->password);
            $user->phone = $request->phone;
            $user->phone_code = $request->phone_code;
            $user->country = $request->country;
	        $user->city = $request->city;

	        $user->address = $request->address;
	        $user->latitude = $request->latitude;
	        $user->longitude = $request->longitude;
	        $user->gender = $request->gender;
	        $user->device_type = $request->device_type;
	        if($user->save()){
		        $response['status'] = 200;
		        $response['message'] = trans('api.user.registration_success');
		        $response['user'] = User::where('id', $user->id)->select('*')->first();
	        	return $response;

	        }else{
	        	$response['status'] = 400;
		        $response['message'] = trans('api.something_went_wrong');
	        	return $response;
	        }

        } catch (\Exception $e) {
        	$response['status'] = 400;
        	$response['message'] = $e->getMessage();
        	return $response;
   		}
    }

    public function createProfile(Request $request){
    	$rules = [
         		'user_id'				=> 'required',
                'love_push_intention' 	=> 'required',
                'relationship' 			=> 'required',
               	'language' 				=> 'required',
               	'size' 					=> 'required',
                'eyecolor'              => 'required|max:255',
                'haircolor' 			=> 'required|max:255',
                'education' 			=> 'required|max:255',
                'job' 					=> 'required',
                'employer'				=> 'required',
                'hobbies' 				=> 'required',
                'sexual_orientation' 	=> 'required|in:1,2,3',
                'aboutme' 				=> 'required'
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user = User::find($request->user_id);
        if(!$user){
        	$response['status'] = 400;
		    $response['message'] = trans('api.user.user_not_found');
	        return $response;
        }
        try{
	        $user->love_push_intention = $request->love_push_intention;
	        $user->relationship = $request->relationship;
	        $user->language = $request->language;
	        $user->size = $request->size;
            $user->haircolor = $request->haircolor;
	        $user->eyecolor = $request->eyecolor;
	        $user->education = $request->education;
	        $user->job = $request->job;
	        $user->employer = $request->employer;
	        $user->hobbies = $request->hobbies;
	        $user->sexual_orientation = $request->sexual_orientation;
	        $user->aboutme = $request->aboutme;
	        $user->is_profile_complete = 1;
            $user->is_phone_verify = 1;
	        $user->save();

	        $tokenResult = $user->createToken('user')->accessToken;
	        $response['status'] = 200;
	        $response['message'] = trans('api.user.profile_success');
			$response['token'] = $tokenResult;
			$response['user'] = $user;
			return $response;

    	} catch(\Exception $e){
    		$response['status'] = 400;
        	$response['message'] = $e->getMessage();
        	return $response;
    	}

    }

    public function login(Request $request){
    	$rules = [

                'username' 	=> 'required',
                'password' 	=> 'required',
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }


        // $language_id = $_SERVER['HTTP_LANGUAGE'];
        // echo $language_id; die;

    	$credentials = request(['username', 'password']);
        if(!Auth::attempt($credentials)){
        	$response['status'] = 401;
		    $response['message'] = 'These credentials are not valid.';
	        return $response;
        }

        $user = $request->user();
        // echo "<pre>"; print_r($user); die;
        // $header = $request->header('locale');
        // echo $header; die;

        $tokenResult = $user->createToken('user')->accessToken;
        $response['status'] = 200;
		$response['token'] = $tokenResult;
		$response['user'] = $request->user();
		return $response;
    }

    public function changePassword(Request $request){
    	$rules = [
    			'old_password' 		=> 'required|min:6',
                'new_password' 	=> 'required|min:6|confirmed'
             
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        $old_password = $request->old_password;
    
        if (Hash::check($old_password, Auth::user()->password)) {
    		$user = User::find(Auth::id());
	        $user->password = Hash::make($request->new_password);
	        $user->save();
	        $response['status'] = 200;
			$response['message'] = trans('api.user.password_change_success');
			return $response;
		}else{
			$response['status'] = 400;
		    $response['message'] = trans('api.user.password_not_matched');
	        return $response;
		}
      
    }

    public function addPostAds(Request $request){
    	$rules = [
                'title' 				=> 'required',
                'description' 			=> 'required',
                'post_type'				=> 'required|in:1,2',
                'image'					=> 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'location'				=> 'required',
                'latitude'				=> 'required',
                'longitude'				=> 'required',
                'is_post_anonymously' 	=> 'required',
                'radius'				=> 'required'
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }
        try{
	        $postad = new PostAds;
	        $postad->user_id = Auth::id();
	        $postad->title = $request->title;
	        $postad->description = $request->description;
	        $postad->post_type = $request->post_type;
	        if (!file_exists(url('/postads'))) {
	            mkdir(url('/postads'), 0777, true);
	        }
	        $image = $request->file('image');
	        $input['imagename'] = time().'.'.$image->getClientOriginalExtension();
	        $destinationPath = public_path('/postads');
	        $image->move($destinationPath, $input['imagename']);
	        $postad->image = $input['imagename'];

	        $postad->location = $request->location;
	        $postad->latitude = $request->latitude;
	        $postad->longitude = $request->longitude;
	        $postad->is_post_anonymously = $request->is_post_anonymously;
	        $postad->radius = $request->radius;

	        $postad->save();

	        $response['status'] = 200;
			$response['message'] = trans('api.user.postads_add_success');
			return $response;
	    } catch(\Exception $e){
    		$response['status'] = 400;
        	$response['message'] = $e->getMessage();
        	return $response;
    	}
    }

    public function getProfile(){
    	$response['status'] = 200;
		$response['profile'] = User::with('profile_images')->find(Auth::id());
		return $response;
    }


    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        $response['status'] = 200;
        $response['message'] = 'Successfully logged out';
        return $response;
    }


    public function updateProfile(Request $request){
    	$rules = [
                'name'          => 'required|max:255',
                'address'       => 'required',
                'gender'        => 'required|in:1,2',
                'city'          => 'required',
                'latitude'      => 'required',
                'longitude'     => 'required',
                'love_push_intention' 	=> 'required',
                'relationship' 			=> 'required',
               	'language' 				=> 'required',
               	'size' 					=> 'required',
                'haircolor'             => 'required',
                'eyecolor'              => 'required|max:255',
                'education' 			=> 'required',
                'job' 					=> 'required',
                'employer'				=> 'required',
                'hobbies' 				=> 'required',
                'sexual_orientation' 	=> 'required|in:1,2,3',
                'aboutme' 				=> 'required',
                'profile_image'			=> 'nullable|image|mimes:jpeg,png,jpg,gif,svg,bmp|max:2048',
            ];

        $photos = count($request->images);
        foreach(range(0, $photos) as $index) {
            $rules['images.' . $index] = 'image|mimes:jpeg,png,jpg,gif,svg,bmp|max:2048';
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        try{
        	$user = User::find(Auth::id());
            $user->name = $request->name;
            $user->address = $request->address;
            $user->gender = $request->gender;
            $user->city = $request->city;
            $user->latitude = $request->latitude;
            $user->longitude = $request->longitude;

	        $user->love_push_intention = $request->love_push_intention;
	        $user->relationship = $request->relationship;
	        $user->language = $request->language;
	        $user->size = $request->size;
            $user->haircolor = $request->haircolor;
	        $user->eyecolor = $request->eyecolor;
	        $user->education = $request->education;
	        $user->job = $request->job;
	        $user->employer = $request->employer;
	        $user->hobbies = $request->hobbies;
	        $user->sexual_orientation = $request->sexual_orientation;
	        $user->aboutme = $request->aboutme;
	        
	        // Profile Images upload 
	        if (!file_exists(url('/profile'))) {
	            mkdir(url('/profile'), 0777, true);
	        }
	        if($request->has('profile_image')){
		        $image = $request->file('profile_image');
		        $input['imagename'] = time().'.'.$image->getClientOriginalExtension();
		        $destinationPath = public_path('/profile');
		        $image->move($destinationPath, $input['imagename']);
		        $user->profile_image = $input['imagename'];

	        }
	        $user->save();
	        // Profile images upload

	        if($request->has('images') && is_array($request->images)){
	        	foreach ($request->images as $k => $v) {
	        		$profileimages = new UserProfileImages;
	        		$profileimages->user_id = Auth::id();
	        		$pimage = $v;
			        $input['imagename'] = rand(99, 99999).time().'.'.$pimage->getClientOriginalExtension();
			        $destinationPath = public_path('/profile');
			        $pimage->move($destinationPath, $input['imagename']);
			        $profileimages->image = $input['imagename'];
			        $profileimages->save();
	        	}
	        }
	       
	        $response['status'] = 200;
	        $response['message'] = trans('api.user.profile_update_success');
			$response['profile'] = User::with('profile_images')->find(Auth::id());
			return $response;

    	} catch(\Exception $e){
    		$response['status'] = 400;
        	$response['message'] = $e->getMessage();
        	return $response;
    	}
    }

    public function exploreUsers(Request $request){
        /*$latitude =  Auth::user()->latitude;
        $longitude =  Auth::user()->longitude;
        $distance = 25;
        if($latitude=='' || $longitude ==''){
            $response['status'] = 400;
            $response['message'] = 'Please add latitude and longitude first.';
            return $response;
        }
        $users = User::where('id', '!=', Auth::id())
        ->where('role', 2)
        ->select(DB::raw('*, ( 6367 * acos( cos( radians('.$latitude.') ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians('.$longitude.') ) + sin( radians('.$latitude.') ) * sin( radians( latitude ) ) ) ) AS distance'))
        ->having('distance', '<', $distance)
        ->orderBy('distance')
        ->get();

        if($users->count()){
            $ids = array();
            foreach ($users as $k => $v) {
                $ids[] = $v['id'];
            }
            if(count($ids)){
                $users = User::whereIn('id', $ids)->paginate(10);
            }
        }*/
        // Find like or match users or reject request user ids
        $notInIds =UserRequest::whereRaw('
            (sender_id = '.Auth::id().' AND is_sender_user_like = 1 AND is_receiver_accepted = 1) OR 
            (sender_id = '.Auth::id().' AND is_sender_user_like = 1 AND is_receiver_accepted = 0) OR 
            (sender_id = '.Auth::id().' AND is_sender_user_like = 1 AND is_receiver_accepted = -1) OR 
            (sender_id = '.Auth::id().' AND is_sender_user_like = -1) 
            ')
        ->pluck('receiver_id');

        $matchIds = UserRequest::whereRaw('(receiver_id = '.Auth::id().' AND is_sender_user_like = 1 AND is_receiver_accepted = 1)')
        ->pluck('sender_id');

        if($notInIds->count() && $matchIds->count()){
            $notInIds = array_merge($matchIds, $notInIds);
        }else if($notInIds->count() == 0 && $matchIds->count()){
            $notInIds = $matchIds;
        }
        
        // Find like request user ids

        $users = User::where('id', '!=', Auth::id())
        ->whereNotIn('id', $notInIds)
        ->where(function ($query) use ($request) {
            if($request->city != ''){
                $query->where('city', '=', trim($request->city));
            }
        })
        ->where('role', 2)
        ->orderBy('created_at', 'desc')
        ->paginate(10);

        $response['status'] = 200;
        $response['users'] = $users;
        return $response;
    }

    public function userLike(Request $request){
        
        $rules = [
                'receiver_id'  => 'required|numeric|exists:users,id',
            ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }
        try{
            //(sender_id = '.Auth::id().' AND receiver_id = '.$request->receiver_id.' AND is_sender_user_like = 1) OR 
            $requestId = UserRequest::whereRaw('(sender_id = '.$request->receiver_id.' AND receiver_id = '.Auth::id().' AND is_sender_user_like = 1)')
            ->pluck('id');
            
            if($requestId->count()){
                $userRequest = UserRequest::find($requestId[0]);

                $userRequest->is_receiver_accepted = 1;
                $userRequest->save();

                $notification = new Notification;
                $notification->user_id = $request->receiver_id;
                $notification->type = 'Like';
                $notification->message = Auth::user()->name.' has accepted your request.';
                $notification->save();

                $response['status'] = 200;
                $response['message'] = trans('api.user.like_request_success');
                return $response;
            }else{
                $userRequest = new UserRequest;
                $userRequest->sender_id = Auth::id();
                $userRequest->receiver_id = $request->receiver_id;
                $userRequest->save();

                $notification = new Notification;
                $notification->user_id = $request->receiver_id;
                $notification->type = 'Like';
                $notification->message = Auth::user()->name.' has sent you a request.';
                $notification->save();

                $response['status'] = 200;
                $response['message'] = trans('api.user.like_request_success');
                return $response;
            }
            
        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function userDislike(Request $request){
        $rules = [
                'receiver_id'  => 'required|numeric|exists:users,id',
            ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }
        try{

            $requestId = UserRequest::whereRaw('(sender_id = '.Auth::id().' AND receiver_id = '.$request->receiver_id.' AND is_sender_user_like = 1) OR (sender_id = '.$request->receiver_id.' AND receiver_id = '.Auth::id().' AND is_sender_user_like = 1)')
            ->pluck('id');

            if($requestId->count()){
                $userRequest = UserRequest::find($requestId[0]);
                $userRequest->is_sender_user_like = -1;
                $userRequest->save();

                $response['status'] = 200;
                $response['message'] = trans('api.user.dislike_request_success');
                return $response;
            }else{
                $userRequest = new UserRequest;
                $userRequest->sender_id = Auth::id();
                $userRequest->receiver_id = $request->receiver_id;
                $userRequest->is_sender_user_like = -1;
                $userRequest->save();

                $response['status'] = 200;
                $response['message'] = trans('api.user.dislike_request_success');
                return $response;
            } 

        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function notifications(){
        try{
            $notifications = Notification::where('user_id', Auth::id())->paginate(10);
            $response['status'] = 200;
            $response['notifications'] = $notifications;
            return $response;

        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }


    public function matchedUsers(Request $request){
        try{
            $matchedUsers = UserRequest::whereRaw('(sender_id = '.Auth::id().' AND is_sender_user_like = 1 AND is_receiver_accepted = 1) OR (receiver_id = '.Auth::id().' AND is_sender_user_like = 1 AND is_receiver_accepted = 1)')
            ->paginate(10);
            
            if($matchedUsers->count()){
                foreach ($matchedUsers as $ky => $ve) {
                    if($ve['sender_id'] == Auth::id()){
                        $matchedUsers['match_user'] = User::find($ve['receiver_id']);
                    }else if($ve['receiver_id'] == Auth::id()){
                        $matchedUsers['match_user'] = User::find($ve['sender_id']);
                    }
                }
            }

            $response['status'] = 200;
            $response['matched_users'] = $matchedUsers;
            return $response;

        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }


    public function personalityQuestions(){
        try{
            $questions = PersonalityQuestions::with('options')->where('is_active', 1)->orderBy('created_at', 'desc')->paginate(10);
            $response['status'] = 200;
            $response['questions'] = $questions;
            return $response;
        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function SubmitPersonalityTest(Request $request){
        /*$rules = [
                'option_id'  => 'required|numeric|exists:personality_questions_options,id',
            ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }*/
        try{
            $option_r = $request->option_id;
            if(count($request->option_id)){
                $optionl = count($request->option_id);
                for($i=0; $i<$optionl; $i++){
                    $personality_test = new PersonalityTest;
                    $personality_test->user_id = Auth::id();
                    $personality_test->option_id = $option_r[$i];
                    $personality_test->save();
                }
                
                $response['status'] = 200;
                $response['message'] = trans('api.user.submit_personality_test_success');
                return $response;
                
            }else{
                $response['status'] = 200;
                $response['message'] = 'Please submit answers.';
                return $response;
            }
        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }


    public function postAds(Request $request){
        try{
            $latitude =  Auth::user()->latitude;
            $longitude =  Auth::user()->longitude;
            
            if($latitude=='' || $longitude ==''){
                $response['status'] = 400;
                $response['message'] = 'Please add latitude and longitude first.';
                return $response;
            }

            $post_ids = array();
            $posts = array();
            $pads_distance = PostAds::select(DB::raw('id, radius,( 6367 * acos( cos( radians('.$latitude.') ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians('.$longitude.') ) + sin( radians('.$latitude.') ) * sin( radians( latitude ) ) ) ) AS distance'))
                ->where(function ($query) use ($request) {
                    if($request->post_type != ''){
                        $query->where('post_type', $request->post_type);
                    }
                })
                ->orderBy('created_at', 'dsc')
                ->get();
            
            if($pads_distance->count()){
                foreach ($pads_distance as $ky => $ve) {
                    $p_radius = $ve['radius'];
                    $distance = round($ve['distance'], 2);

                    if($distance <= $p_radius){
                        $post_ids[] = $ve['id'];
                    }
                }
            }

            if(count($post_ids)){
                $posts = PostAds::whereIn('id', $post_ids)->orderBy('created_at', 'dsc')->paginate(10);
            }else{
                $posts = PostAds::whereIn('id', [0, -10])->orderBy('created_at', 'dsc')->paginate(10);
            }
            
            $response['status'] = 200;
            $response['posts'] = $posts;
            return $response;

        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function recommendedProfile(){
        try{
            $luser_p_test =  PersonalityTest::where('user_id', Auth::id())->pluck('option_id');
            if(!$luser_p_test->count()){
                $response['status'] = 400;
                $response['message'] = 'Please give personality test first.';
                return $response;
            }

            $other_p_test = User::select('id')->where('role', 2)->where('id', '!=', Auth::id())->with('personality_test')->get();
            $m_users =  array();
            $user_ids = array();
            if($other_p_test->count()){
                foreach ($other_p_test as $ky => $ve) {
                    if($ve['personality_test']->count()){
                        $test = array();
                        foreach ($ve['personality_test'] as $kt => $vt) {
                            $test[] = $vt['option_id'];
                        }
                        
                        $m_percentage = $this->calMatchedPercentage($luser_p_test, $test);
                        if($m_percentage != 0){
                            $user_ids[] = $vt['user_id'];
                            $m_user[] =  array(
                                        'user_id' => $vt['user_id'],
                                        'matched_percentage' => $m_percentage
                                    );
                        }
                        
                    }
                    
                }
            }
            if(count($user_ids)){
                $recommendeusers = User::whereIn('id', $user_ids)->paginate(10);
                foreach ($recommendeusers as $kry => $vre) {
                    foreach ($m_user as $kp => $vp) {
                        if($vre['id'] == $vp['user_id']){
                            $recommendeusers[$kry]['matched_percentage'] = $vp['matched_percentage'];
                        }   
                    }
                }
            }else{
                $recommendeusers = User::whereIn('id', [-1, -10])->paginate(10);
            }
           
            $response['status'] = 200;
            $response['recommendeusers'] = $recommendeusers;
            return $response;
        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function calMatchedPercentage($luser, $ouser){
        $a = $luser->toArray();
        $b = $ouser;
        $c = 0;
        foreach ($a as $i) {
            if (in_array($i,$b)) $c++;
        }
        return round(($c/count($a))*100, 2);
    }

    public function ownPostads(){
        $postads = PostAds::where('user_id', Auth::id())->paginate(10);
        $response['status'] = 200;
        $response['postads'] = $postads;
        return $response;
    }


    public function addFeed(Request $request){
        $rules = [
                'title'                 => 'required',
                'description'           => 'required',
                'image'                 => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }
        try{
            $feed = new Feed;
            $feed->user_id = Auth::id();
            $feed->title = $request->title;
            $feed->description = $request->description;
            if (!file_exists(url('/feeds'))) {
                mkdir(url('/feeds'), 0777, true);
            }
            $image = $request->file('image');
            $input['imagename'] = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/feeds');
            $image->move($destinationPath, $input['imagename']);
            $feed->image = $input['imagename'];
            $feed->save();
            $response['status'] = 200;
            $response['message'] = trans('api.user.feed_add_success');
            return $response;
        } catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function getOwnFeeds(){
        $feeds = Feed::where('user_id', Auth::id())->paginate(10);
        $response['status'] = 200;
        $response['feeds'] = $feeds;
        return $response;
    }

    public function updateSetting(Request $request){
        $rules = [
                'country'                 => 'required',
                'is_restrict_fb_friends'  => 'required',
                'partner_preference'      => 'required',
                
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }
        try{
            $user = User::find(Auth::id());
            $user->country = $request->country;
            $user->is_restrict_fb_friends = $request->is_restrict_fb_friends;
            $user->partner_preference = $request->partner_preference;
            $user->save();
            $response['status'] = 200;
            $response['message'] = trans('api.user.update_setting_success');
            $response['user'] = User::find(Auth::id());
            return $response;
        }catch(\Exception $e){
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
      
        }
    }
}
