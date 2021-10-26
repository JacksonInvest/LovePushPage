<?php

namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Auth;
use Session;
use Hash;

use App\State;
use App\User;
use App\Admin;
use Validator;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
	public function login(Request $request){

		if($request->isMethod('post')) {

			$data = $request->input();
			$remeber = (isset($request->remember)) ? true : false;
			if(Auth::guard('admin')->attempt([
					'email' => $data['email'],
					'password' 	=> $data['password']
				], $remeber)
			) {  
				return redirect('/admin/dashboard')->with('success','Welcome, '. ucfirst(Auth::guard('admin')->user()->name) );
			} else{ 
				return redirect('/admin/login')->with('error','Email/Password combination is incorrect');
			}

		} else{
			return view('backEnd.auth.login');
		}
	}

	public function logout(Request $request){ 
		if(Auth::guard('admin')->check()){ 
			Auth::guard('admin')->logout();
		} 
		return redirect('/admin/login')->with('success','You have been logged out successfully');
	}

	public function forgot_password(Request $request){ //send email

		if($request->isMethod('post')){

			$validator = Validator::make($request->all(),[
				'email' => 'required|exists:admins,email'
			],[
				'email.exists' => __('messages.email not exist err')
			]);

			if($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput($request->input());
			} else{
				$email_sent = Admin::sendForgotPassEmail($request->email);
		 		
		 		return redirect('admin/reset-password?email='.$request->email)->with('success',__('messages.forgot pass email success'));
		 		// return view('backEnd.auth.passwords.reset')->with('success',__('messages.forgot pass email success'));
			}
		} else{
			return view('backEnd.auth.passwords.email');

		}
	}

	public function reset_password(Request $request){ //set new password

		if($request->isMethod('post')){
			
			$validator = Validator::make($request->all(),[
				'email' => 'required|exists:admins,email',
				'verify_code' => 'required',
				'password' => 'required|min:6|confirmed|max:255'
			],[
				'email.exists' => __('messages.email not exist err'),
			]);

			if($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput($request->input());

			} else{
				$admin = Admin::select('id','verify_code_created_at')
							->where('email',$request->email)
							->where('verify_code',$request->verify_code)
							->first();

				if(!empty($admin)){
					
					$cu = date('Y-m-d H:i:s');
					$to = \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $cu);
					$from = \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $admin->verify_code_created_at);
					$diff_in_minutes = $to->diffInMinutes($from);
					if($diff_in_minutes <= 15){

						$admin->password 	= Hash::make($request->password);
						$admin->verify_code = '';
						$admin->verify_code_created_at = null;

						if($admin->save()){
							return redirect('admin/login')->with('success', __('messages.password set success'));

						} else{
							return redirect()->back()->with('error', __('messages.COMMON_ERR'));
						}

					} else{
						return redirect()->back()->with('error', __('messages.verif code expired'));
					}
				} else{
					return redirect()->back()->with('error', __('messages.verif code invalid'));
				}

	    	}
		} else{
			$email = $request->email;
			$email_count = Admin::where('email',$email)->count();
			if($email_count > 0){
	 			return view('backEnd.auth.passwords.reset', compact('email'));
			} else{
				return redirect()->back()->with('error',__('messages.email not exist err'));
			}
		}
	}

}