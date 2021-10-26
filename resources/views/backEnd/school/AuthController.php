<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Auth;
use Session;
use Hash;
use Validator;
use Illuminate\Validation\Rule;

use App\User;
use App\UserApiToken;
use App\UserDevice;
use App\School;
use Carbon\Carbon;
use App\Traits\QuickBlox;
use App\Jobs\CloseByUsersCron;

class AuthController extends Controller
{
	use QuickBlox;

	public function login(Request $request){

		if($request->isMethod('post')) {

			$validator = Validator::make($request->all(), [
				'email' => [
					'required',
					'email',
					Rule::exists('users')->where(function($query){
						$query->where('status',1);
					})
				],
				'password' 			=> 'required',
				'device_type' 		=> 'nullable',
				'device_fcm_token' 	=> 'nullable'
	        ],[
	        	'email.exists' 		=> __('messages.user err')
	        ]);

	        if ($validator->fails()) {
	  		 	return response()->json([
		 			'status' => false,
		 			'message'=> $validator->errors()->first()
		 		],400);
	        } else{
						
				$user = User::getUserByEmail($request->email);
				if(!empty($user)){
		        	if($user->status == 1){
						if(Hash::check($request->password,$user->password)){
							$user_id = $user->id;

							//save device fcm token - used for push notifications
							// UserDevice::saveDevice($request,$user_id);
							
							//save api token - used for checking is user loggged in from the same device
							$token = UserApiToken::saveUserApiToken($user_id);					

							//register in quick blox
							// if(empty($user->quickblox_id)){
							// 	$res = $this->QuickBloxRegistration($user);
							// 	// echo '<pre>'; print_r($res); die;
							// 	if(@$res['status'] === true){
							// 		$user->quickblox_id = @$res['quickblox_id'];
							// 	}
							// }

							if(!empty($token)){
								return response()->json([
						 			'status' => true,
									'message' 	=> __('messages.login success'),
									'data' 		=> $user,
									'token'	    => $token,
						 		],200);
							} else{
								return response()->json([
						 			'status' => false,
									'message' 	=> __('messages.COMMON_ERR')
						 		],400);				
							}
						} else{ 
							return response()->json([
					 			'status' => false,
								'message' 	=> __('messages.incorrect pass err')
					 		],400);

						}
					} else{
						return response()->json([
				 			'status' => false,
							'message' 	=> __('messages.account inactive')
				 		],400);
					}
				} else{
					return response()->json([
			 			'status' => false,
						'message' 	=> __('messages.user err')
			 		],400);
				}
			}
		}
	}

	// public function logout(Request $request){
	// 	$validator = Validator::make($request->all(), [
 //            'user_id' => [
 //            	'required',
 //        		Rule::exists('users','id')->where(function($query){
	// 				$query->where('status',1);
	// 			})
 //        	]
 //        ]);
 //        if ($validator->fails()) {
 //  		 	return response()->json([
	//  			'status' => 400,
	//  			'message'=>$validator->errors()->first()
	//  		]);
 //        } else{

	// 		UserApiToken::where('user_id',$request->user_id)->update(['token' => '']);
	// 		UserDevice::where('user_id',$request->user_id)->update(['token' => '']);
	// 		return array(
	// 			'status' 	=> 200,
	// 			'message' 	=> __('messages.logout success')
	// 		);
 //        }
	// }

	public function signup(Request $request){

		$validator = Validator::make($request->all(), [
            'gender' 		    => 'required',
			'seeking_gender' 	=> 'required',
			'current_school' 	=> 'required',
			'name' 		        => 'required',
			'email' 			=> 'required|email|unique:users',
			'password' 			=> 'required',
			'major' 			=> 'required',
			'partner_from' 		=> 'required',
			'image' 		    => 'required',
			// 'partner_from' 		=> 'nullable',
        ]);
        if ($validator->fails()) {
  		 	return response()->json([
	 			'status' => false,
	 			'message'  => $validator->errors()->first()
	 		],400);
        } else{
        	
        	try {
        		
	        	$data  = $request->all();
	        	// echo "<pre>"; print_r($data); die;

	        	$user = new User;

	        	$user->gender         = $data['gender'];
		        $user->seeking_gender = $data['seeking_gender'];
		        $user->current_school = trim($data['current_school']);
		        $user->name           = trim($data['name']);
		        $user->email          = trim($data['email']);
		        $user->major          = trim($data['major']);
		        $user->partner_from   = trim($data['partner_from']);
		        $user->password       = Hash::make($data['password']);
		        $user->image          = '';
		        if ($request->hasFile('image')) {
		            $image = $request->file('image');
		            $name  = time().'.'.$image->getClientOriginalExtension();
		            // $destinationPath = public_path('asset/img/services/');
		            $destinationPath = base_path(USER_PROFILE_IMG_PATH);

		            $image->move($destinationPath, $name);
		            $user->image = $name;                 
		        }

	        	if($user->save()){

	        		// User::sendRegisterationEmail($user->id);
	        		User::sendVerificationCodeEmail($user->id);

	        		//login response start
	        		//save device fcm token
					// UserDevice::saveDevice($request,$user->id);
					
					//save api token
					$token = UserApiToken::saveUserApiToken($user->id);					
					

					//register in quick blox - before register in our system
					// $quick_resp = $this->QuickBloxRegistration($user);
					
					if(!empty($token)){

						$user = User::getUser($user->id);

						return response()->json([
				 			'status' => true,
				 			'message'=> __('messages.register_otp_send'),
				 			// 'message'=> __('messages.register success'),
							'data' 		=> $user,
							'token'	    => $token,
				 		],200);
					} else{
						return response()->json([
				 			'status' => false,
							'message' 	=> __('messages.COMMON_ERR')
				 		],400);
					}
	        		//login response end
	      
	        	} else{
	        		return response()->json([
						'status' => false,
						'message' 	=> __('messages.COMMON_ERR')
			 		],400);
				}
        	} 
			catch (Exception $e) {
        		echo $e->getMessage(); die;
        	}
		}
	}


	public function otpVerification(Request $request) {


		$validator = Validator::make($request->all(), [
			'user_id' => 'required',
            'otp' 	=> 'required',
        ]);
        if ($validator->fails()) {
  		 	return response()->json([
	 			'status' => false,
	 			'message'  => $validator->errors()->first()
	 		],400);
        }

        $check_user = User::where('id', $request->user_id)->first();
        if(!empty($check_user)) {

        	$match_otp = User::where(['id' => $request->user_id, 'email_verification_otp'=> $request->otp])->first();
        	if(!empty($match_otp)) {
        		$update = User::where(['id' => $request->user_id, 'email_verification_otp'=> $request->otp])->update(['email_verification' => 1]);
        		if($update) {
        			$user = User::getUserByEmail($check_user->email);
        			$token = UserApiToken::saveUserApiToken($request->user_id);	

        			return response()->json([
						'status' => true,
						'message' 	=> 'Otp match, Kindly login.',
						'data' => $user,
						'token' => $token,
			 		],200);
        		} else {
        			return response()->json([
						'status' => false,
						'message' 	=> __('messages.COMMON_ERR')
			 		],400);
        		}
        	} else {
        		return response()->json([
					'status' => false,
					'message' 	=> 'Incorrect otp.'
		 		],400);	
        	}

        } else {
        	return response()->json([
				'status' => false,
				'message' 	=> 'User does not exist'
	 		],400);
        }


	}

	public function change_password(Request $request){
		
		$validator = Validator::make($request->all(),[
			"user_id" => 'required',
			"current_password" => 'required|min:5',
			"new_password" => 'required'
		]);

		if($validator->fails()){
  		 	return response()->json([
	 			'status' => 400,
	 			'message'=>$validator->errors()->first()
	 		]);
		} else{
			$user = User::where('id',$request->user_id)->select('id','password')->first();
			if(!empty($user)){
				if(Hash::check($request->current_password,$user->password)){

					$user->password = Hash::make($request->new_password);
					if($user->save()){
			  		 	return response()->json([
				 			'status' => 200,
				 			'message'=> __('messages.pass change succ')
				 		]);	
					} else{
			  		 	return response()->json([
				 			'status' => 400,
				 			'message'=> __('messages.COMMON_ERR')
				 		]);									
					}

				} else{
		  		 	return response()->json([
			 			'status' => 400,
			 			'message'=> __('messages.cur pass incorrect') 
			 		]);									
				}	
			}else{
	  		 	return response()->json([
		 			'status' => 400,
		 			'message'=> __('messages.user err') 
		 		]);				
			}
		}
	}


	public function forgotPassword(Request $request){ //send email

		$validator = Validator::make($request->all(),[
			'email' => [
				'required',
				Rule::exists('users')->where(function ($query) {                      
		            $query->where('status', 1);                  
		        })
			]
		],[
			'email.exists' => __('messages.email not exist err')
		]);

		if($validator->fails()) {
			return response()->json([
	 			'status' => 400,
	 			'message'=>$validator->errors()->first()
	 		]);
		} else{
			$email_sent = User::sendForgotPassEmail($request->email);
			
       		return response()->json([
	 			'status' => 200,
	 			'message'=> __('messages.forgot pass email success')
	 		]);					
		}
	}

	public function schoolList() {

		$schools = School::where('status', 1)->get();

		return response()->json([
 			'status' => true,
 			'message'=> "School List",
			'data' 		=> $schools,
 		],200);
	}

	// public function forgot_password(Request $request){ //send email

	// 	$validator = Validator::make($request->all(),[
	// 		'email' => [
	// 			'required',
	// 			Rule::exists('users')->where(function ($query) {                      
	// 	            $query->where('status', 1);                  
	// 	        })
	// 		]
	// 	],[
	// 		'email.exists' => __('messages.email not exist err')
	// 	]);

	// 	if($validator->fails()) {
	// 		return response()->json([
	//  			'status' => 400,
	//  			'message'=>$validator->errors()->first()
	//  		]);
	// 	} else{
	// 		$email_sent = User::sendForgotPassEmail($request->email);
			
 //       		return response()->json([
	//  			'status' => 200,
	//  			'message'=> __('messages.forgot pass email success')
	//  		]);					
	// 	}
	// }
	
	// public function forgot_password_verify(Request $request){ //check otp

	// 	$validator = Validator::make($request->all(),[
	// 		'email' => [
	// 			'required',
	// 			Rule::exists('users')->where(function ($query) {                      
	// 	            $query->where('status', 1);                  
	// 	        })
	// 		],
	// 		'verify_code' => 'required'
	// 	],[
	// 		'email.exists' => __('messages.email not exist err')
	// 	]);

	// 	if($validator->fails()) {
	// 		return response()->json([
	//  			'status' => 400,
	//  			'message'=>$validator->errors()->first()
	//  		]);
	// 	} else{
	// 		$user = User::select('id','verify_code_created_at')
	// 					->where('email',$request->email)
	// 					->where('verify_code',$request->verify_code)
	// 					->first();
	// 		if(!empty($user)){
	
	// 			$cu = date('Y-m-d H:i:s');
	// 			$to = \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $cu);
	// 			$from = \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $user->verify_code_created_at);
	// 			$diff_in_minutes = $to->diffInMinutes($from);
	// 			if($diff_in_minutes <= 15){

	// 				$user->security_code = str_random(10);
	// 				if($user->save()){
	// 					return response()->json([
	// 			 			'status' => 200,
	// 			 			'message'=> __('messages.otp verify succ'),
	// 			 			'security_code' => $user->security_code
	// 			 		]);
	// 				} else{
	// 					return response()->json([
	// 			 			'status' => 400,
	// 			 			'message'=> __('messages.COMMON_ERR')
	// 			 		]);
	// 				}

	// 			} else{
	// 				return response()->json([
	// 		 			'status' => 400,
	// 		 			'message'=>__('messages.otp expired')
	// 		 		]);					
	// 			}
	// 		} else{
	// 			return response()->json([
	// 	 			'status' => 400,
	// 	 			'message'=>__('messages.otp invalid')
	// 	 		]);
	// 		}
	// 	}
	// }

	// public function forgot_password_set_password(Request $request){ //set new password
	// 	$email = $request->email ?? null;
	// 	$validator = Validator::make($request->all(),[
	// 		'email' => [
	// 			'required',
	// 			Rule::exists('users')->where(function($query){
	// 				$query->where('status',1);
	// 			})
	// 		],
	// 		'security_code' => [
	// 			'required',
	// 			Rule::exists('users')->where(function($query) use ($email) {
	// 				$query->where('email',$email);
	// 			})
	// 		],
	// 		'password' => 'required'
	// 	],[
	// 		'email.exists' => __('messages.email not exist err'),
	// 		'security_code.exists' => __('messages.COMMON_ERR') //if security code not correct
	// 	]);

	// 	if($validator->fails()) {
	// 		return response()->json([
	//  			'status' => 400,
	//  			'message'=>$validator->errors()->first()
	//  		]);
	// 	} else{ 
	// 		//set new password and reset the forget pass verify code fields
	// 		$updated = User::where('email',$request->email)
	// 					->where('security_code',$request->security_code)
	// 					->update([
	// 						'password' => Hash::make($request->password),
	// 						'verify_code' => '',
	// 						'verify_code_created_at' => null,
	// 						'security_code' => ''
	// 					]);

	// 		if(!empty($updated)){
	
	// 			return response()->json([
	// 	 			'status' => 200,
	// 	 			'message'=> __('messages.password set success'),
	// 	 		]);
	// 		} else{
	// 			return response()->json([
	// 	 			'status' => 400,
	// 	 			'message'=>__('messages.otp try again err')
	// 	 		]);
	// 		} 
 //    	}
	// }

}