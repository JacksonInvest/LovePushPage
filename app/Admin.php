<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Mail;

class Admin extends Authenticatable
{
    public static function getCaptureDistance(){
    	return Admin::where('id',1)->value('capture_distance');
    }

    public function getImageAttribute($value){ //accessor
    	if(!empty($value)){
            return asset(ADMIN_IMG_PATH.$value);
    	} else{
            return asset(SYS_IMG_PATH.'default_user.png');
        }
    }

    public function geFirstNameAttribute($value){ //accessor
        return ucfirst($value);
    }

    public function getActualAttribute($field){
        return $this->attributes[$field];
    }

    public static function sendForgotPassEmail($email=null){
        $user = Admin::select('id','name','email','verify_code')->where('email',$email)->first();

        $rand = rand(111111,999999);
        $user->verify_code = $rand;
        $user->verify_code_created_at = date('Y-m-d H:i:s');
        if($user->save()){

            $company_name = PROJECT_NAME;
            // $to_email = $user->email;
            $to_email = 'xicomtest123456@gmail.com';
            
            $email_format = Email::getEmail('forgot_password_admin');
            $content = $email_format->content;
            $subject = $email_format->subject;

            $content = str_replace('{{$name}}', $user->name, $content);
            $content = str_replace('{{$email}}', $user->email, $content);
            $content = str_replace('{{$verify_code}}', $user->verify_code, $content);

            if (!filter_var($to_email, FILTER_VALIDATE_EMAIL) === false) { 
                Mail::send('emails.forgot_pass_email_to_admin',
                    ['content' => $content], 
                    function($message) use ($to_email,$company_name,$subject){
                        $message->to($to_email,$company_name)->subject($subject);
                    }
                );
                return true;
            } 
        }   
    }
}