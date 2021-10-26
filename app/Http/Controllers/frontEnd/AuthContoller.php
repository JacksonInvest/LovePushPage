<?php

namespace App\Http\Controllers\frontEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Hash;
use Auth;
use DB;
use App\User;
use App\WebUser;

class AuthContoller extends Controller
{
    
    public  function signUp(Request $request) {

        $data = $request->all();

        $user                = new WebUser;
        $user->name          = $request->name;
        $user->email         = $request->email;
        $user->register_from = 'web';
        // $user->password = Hash::make($request->password);
        if($user->save()) {

            // //Welcome Email
            // User::sendRegisterationEmail($user->id);

            //Email verification using link
            WebUser::sendEmailVerificationByLink($user->id);

            return redirect('/')->with('success','Account created successfully.');
        } else {
            return redirect('/')->with('error',COMMON_ERROR);
        }
    }

    public function checkEmailExists(Request $request){
        
        $data = $request->input();
        
        $email = '';
        if(is_array($data)){
            $user_name_arr = array_values($data);
            $user_name     = $user_name_arr[0];
        }

        $response = WebUser::emailUnique($user_name);
        echo json_encode($response);
        //echo $response; die;     
    }

    public function emailVerfication($user_id= null, $verification_code = null) {

        // echo $user_id."<br>";
        // echo $verification_code; 
        // die;

        $decoded_user_id = convert_uudecode(base64_decode($user_id));
        $decoded_code    = convert_uudecode(base64_decode($verification_code));

        $user = WebUser::where('id',$decoded_user_id)
                        ->where('verification_code',$decoded_code)
                        ->first();
    
        if(!empty($user)){ 
            $name = $user->name;


            // //Welcome Email
            WebUser::sendWelcomeEmail($user->id);

            $update = WebUser::where('id', $user->id)->update(['verification_code' => Null, 'email_verified_at' => date('Y:m:d h:i:s')]);
            return redirect('/')->with('success','Email verified successfully.');        
        } else{ 
            return redirect('/')->with('error','This link has been already used.');        
        }                        
    }

    public function resetpassword(Request $request, $id){
        $user = User::where(['reset_link'=>$id])->first();
        if($user){
            return view('resetpassword',['user'=>$user]);
        }
        else{
            print_r("Page not found");
        }
    }

    public function resetpassword_action(Request $request){
        $validator = Validator::make($request->all(),[
            "new_password" => 'required',
            "repeat_password"   => 'required',
        ]);

        if($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        else{
            if($request->input('new_password') == $request->input('repeat_password')){
                $userDetails = User::where(['id'=>$request->input('user_id')])->first();
                if($userDetails){
                    $update = User::where(['id'=>$request->input('user_id')])->update([
                        'password' => Hash::make($request->input('new_password'))
                    ]);
                    if($update){
                        User::where(['id'=>$request->input('user_id')])->update(['reset_link'=>'']);
                        return redirect('/reset_msg')->with('success','Password reset successfully. Kindly login.');
                    }
                    else{
                         return redirect()->back()->with('error','Something went wrong. Please try again later.');
                    }
                }
                else{
                     return redirect()->back()->with('error','User not exist.');
                }
            }
            else{
                return redirect()->back()->with('error','Password Mismatched');
            }
        }
    }

    public function reset_msg(Request $request){
        return view('reset_msg');
    }
}
