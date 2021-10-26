<?php

namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use App\Http\Requests\StoreUser;

use App\User;
use App\WebUser;
use App\Military;
use App\Political;
use App\Religion;
use App\Relationship;
use App\State;
use App\City;
use App\UserImage;
use App\School;
use App\DeletedAccount;
use App\BlockList;
use App\ChatRequest;
use App\ConnectRequest;
use App\Like;
use App\PostAds;
use App\PostLike;
use App\ReportChat;
use App\UserProfileImages;
use App\Match;
use App\ChatStatus;
use App\QbChatDialogId;
use App\Notification;
use App\NotificationDesc;
use App\Post;
use App\UserTest;
use App\TestQuesComparison;
use App\TestScore;
use App\TestQues;
use App\TestQuesAns;
use App\ReportImage;
use DB;
use Hash;
use Illuminate\Validation\Rule;
use App\Traits\QuickBlox;
// use App\Traits\QuickBlox;

class UserManagement extends Controller
{
	use QuickBlox;

	public function index(Request $request){

		$type  = $request->type;
		if($type == 'web'){
			$users = WebUser::select('id','name','gender','email','status','created_at')
						->orderBy('id','desc')
						->when($request->type, function($query) use ($request) {
							if($request->type == 'web'){
							    return $query->where('register_from',$request->type);
							} else {
							    return $query->where('register_from',Null);
							}
						})
						->get();
		}
		else{
			$users = User::select('id','name','gender','email','status','created_at')
						->orderBy('id','desc')
						->when($request->type, function($query) use ($request) {
							if($request->type == 'web'){
							    return $query->where('register_from',$request->type);
							} else {
							    return $query->where('register_from',Null);
							}
						})
						->get();
		}
		
		return view('backEnd.user.index', compact('users','type'));
	}

	public function add(Request $request){

		$type = $request->type;

		$invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];

		if($request->isMethod('post')){
			
			$request->validate([
				'name'          => [
                    'nullable','max:255',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                    // Rule::notIn(array_map("like", $invalidWords)),
                ],
				'username' => [
                    'required','unique:users',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                    // Rule::notIn(array_map("like", $invalidWords)),
                ],
				'gender'    		 => 'required|max:100',
				'email' 			 => 'required|email|unique:users|max:100',
				//'phone' 			 => 'nullable|max:20',
				'image' 			 => 'nullable|mimes:jpeg,jpg,png',
				'password'  		 => 'required|min:5',
				'status'             => 'required',
				'partner_preference' => 'required',
			]);

			if(!$this->_checkStringIsValid($request->name, $invalidWords) ) {
	            return response()->json([
	                'message'=> "Your name contain forbidden words.", 
	                'status' => 400,
	            ]);
	        }

	        if(!$this->_checkStringIsValid($request->username, $invalidWords) ) {
	            return response()->json([
	                'message'=> "Your username contain forbidden words.", 
	                'status' => 400,
	            ]);
	        }

	        if(!$this->_checkStringIsValid($request->email, $invalidWords) ) {
	            return response()->json([
	                'message'=> "Your email contain forbidden words.", 
	                'status' => 400,
	            ]);
	        }

			$data = $request->all();
			if(!empty($data['password'])){
	            $data['password'] = Hash::make($data['password']);
	        } else{
	            unset($data['password']);
	        }
	        unset($data['_token']);
	        unset($data['type']);

	        $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        	$myReferalCode = substr(str_shuffle($str_result), 0, 6);

        	if($request->has('love_push_intention')) {
        		$love_push_intention = implode(",", $data['love_push_intention']);
        	}
        	else{
        		$love_push_intention = "";
        	}

        	$user               = new User;
	        $user->name         = trim($data['name']);
	        $user->username     = $data['username'];
	        $user->email        = trim($data['email']);
	        $user->password     = $data['password'];
	        //$user->phone_code        = $data['phone_code'];
	        //$user->phone        = $data['phone'];
	        //$user->phone_code   = ($data['phone_code']) ? $data['phone_code'] : '';
	        $user->login_type   = 1;
	        $user->gender       = $data['gender'];
	        $user->hobbies      = trim($data['hobbies']);
	        $user->aboutme      = trim($data['aboutme']);
	        $user->love_push_intention      = $love_push_intention;
	        $user->age      = trim($data['age']);
	        $user->sexual_orientation      = trim($data['sexual_orientation']);
	        $user->partner_preference       = trim($data['partner_preference']);
	        $user->relationship       = trim($data['relationship']);
	        $user->language       = trim($data['language']);
	        $user->size       = trim($data['size']);
	        $user->physique       = trim($data['physique']);
	        $user->job       = trim($data['job']);
	        $user->education       = trim($data['education']);
	        $user->status       = trim($data['status']);
	        $user->locale       = 'en';
	        $user->myReferalCode = strtoupper($myReferalCode);
	        $user->save();
	        $user_id = $user->id;
	        User::sendVerificationCodeEmail($user_id);

			if($user_id){
				// $quick_resp = $this->QuickBloxRegistration($user);
				$user_data = User::getUserById($user_id);
				$this->QuickBloxRegistration($user_data);

				return redirect('/admin/users?type='.$type)->with('success','User has been saved successfully');
			} else{
				return redirect()->back()->with('error',COMMON_ERR);
			}
		}
		return view('backEnd.user.form',compact('type'));
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

	public function edit(Request $request,$user_id = null){

		$url = $request->url();
		// echo $url."<br>";

		$type = $request->type;
		if($request->isMethod('post')){

			$request->validate([
				'name' 				 => 'required|max:100',
				'gender'    		 => 'required|max:100',
				'email' 			 => 'required|email|max:100',
				//'phone' 			 => 'nullable|max:20',
				'image' 			 => 'nullable|mimes:jpeg,jpg,png',
				'password'  		 => 'nullable|min:5',
				'status'             => 'required',
				'partner_preference' => 'required',
			]);

			$user = User::editUser($request, $user_id);
			if($user != false){
   				// $this->QuickBloxUserUpdate($user_id);
				return redirect('/admin/users?type='.$type)->with('success','User has been edited successfully');
			} else{
				return redirect()->back()->with('error',COMMON_ERR);
			}
		}

		$user = User::where('id',$user_id)->first();		
		if(!empty($user)){	
			// echo "<pre>"; print_r($user); die;
			return view('backEnd.user.form', compact('user','type'));
		} else{
			return redirect()->back()->with('error','User not found');
		}
	}

	public function delete(Request $request, $user_id = null){
        $this->QuickBloxUserDelete($user_id);
        User::where(['id'=>$user_id])->delete();
        BlockList::where('user_id',$user_id)->orWhere('blocked_user_id',$user_id)->delete();
        ChatRequest::where('from_user_id',$user_id)->orWhere('to_user_id',$user_id)->delete();
        ConnectRequest::where('from_user_id',$user_id)->orWhere('to_user_id',$user_id)->delete();
        Like::where('from_user_id',$user_id)->orWhere('to_user_id',$user_id)->delete();
        PostAds::where('user_id',$user_id)->delete();
        PostLike::where('user_id',$user_id)->delete();
        ReportChat::where('user_id',$user_id)->orWhere('reported_user_id',$user_id)->delete();
        UserProfileImages::where('user_id',$user_id)->delete();
        ReportImage::where('user_id',$user_id)->delete();
        ReportImage::where('reported_user_id',$user_id)->delete();

        $matches = Match::where('user_id',$user_id)->orWhere('like_by_me',$user_id)->get();
        foreach($matches as $match){
           Match::where('id',$match['id'])->delete();
           ChatStatus::where('match_id',$match['id'])->delete();
           QbChatDialogId::where('match_id',$match['id'])->delete();
        }

        $notifications = Notification::where('user_id',$user_id)->orWhere('to_user_id',$user_id)->get();
        foreach($notifications as $notification){
            Notification::where('id',$notification['id'])->delete();
            NotificationDesc::where('notification_id',$notification['id'])->delete();
        }

        $posts = Post::where('user_id',$user_id)->get();
        foreach($posts as $post){
            Post::where('id',$post['id'])->delete();
            PostLike::where('post_id',$post['id'])->delete();
        }

        $test_id = UserTest::where('user_id', $user_id)->value('id');
        if($test_id) {
            TestQuesComparison::where(function($query) use ($test_id) {
                                                    $query->orWhere('test_id_1', $test_id);
                                                    $query->orWhere('test_id_2', $test_id);
                                                })
                                                ->delete();
            TestScore::where(function($query) use ($test_id) {
                                            $query->orWhere('test_id_1', $test_id);
                                            $query->orWhere('test_id_2', $test_id);
                                        })                            
                                        ->delete();

            $testQues = TestQues::where('test_id',$test_id)->get();
            foreach($testQues as $testQue){
                TestQuesAns::where('test_que_id',$testQue['id'])->delete();
            }
            TestQues::where('test_id',$test_id)->delete();
            UserTest::where('id', $test_id)->delete();
        }

        DB::table('oauth_access_tokens')->where('user_id',$user_id)->delete();

        $deleted = 1;

		if($deleted){

			$type = $request->type;

			return redirect('admin/users?type='.$type)->with('success','User has been deleted successfully');
		} else{
			return redirect()->back()->with('error',COMMON_ERR);
		}
	}

	public function deleted_accounts(Request $request){
		$deleted_accounts = DeletedAccount::orderBy('id','desc')->get();
		
		return view('backEnd.user.deleted_account', compact('deleted_accounts'));
	}

	// public function delete_image($usr_img_id = null){
	// 	$img = UserImage::find($usr_img_id);
	// 	if(!empty($img)){
	// 		$user_id = $img->user_id;
	// 		$deleted = UserImage::deleteUserImage($usr_img_id);
	// 		if($deleted == true){
	// 			return redirect('admin/user/edit/'.$user_id)->with('success','Image has been deleted successfully');
	// 		} else{
	// 			return redirect()->back()->with('error',COMMON_ERR);
	// 		}
	// 	} else{
	// 		return redirect()->back()->with('error',COMMON_ERR);
	// 	}
	// }

	// public function delete_resume($user_id = null){
	// 	$deleted = UserImage::deleteResume($user_id);
 //     	if($deleted == true){
	// 		return redirect('admin/user/edit/'.$user_id)->with('success','Resume has been deleted successfully');
	// 	} else{
	// 		return redirect()->back()->with('error',COMMON_ERR);
	// 	}
	// }

	// public function delete_main_image($user_id = null){
	// 	$deleted = UserImage::deleteUserMainImage($user_id);
 //     	if($deleted == true){
 //            $this->QuickBloxUserUpdate($user_id);

	// 		return redirect('admin/user/edit/'.$user_id)->with('success','Main image has been deleted successfully');
	// 	} else{
	// 		return redirect()->back()->with('error',COMMON_ERR);
	// 	}
	// }
}