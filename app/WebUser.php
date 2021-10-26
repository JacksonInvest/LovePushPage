<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Mail;
use Hash;
use Auth;

class WebUser extends Model
{
	protected $table = "web_users";

	public static function emailUnique($email = null) {

        //return true if not exists
        //return false if exists

        //username check in user table
        $count = WebUser::where('email',$email)->count();
        if($count > 0) {
            return false;

        } 
        return true;
    }

    //send email verification link to website user
    public static function sendEmailVerificationByLink($user_id = null) {

        $user = WebUser::select('id','name','email')->where('id',$user_id)->first();
        $random_no               = rand(1111,9999);
        $verification_code       = base64_encode(convert_uuencode($random_no));
        $user_id                 = base64_encode(convert_uuencode($user->id));
        $email                   = $user->email;
        $name                    = $user->name;
        $user->verification_code = $random_no;
        $name                    = $user->name;

        $company_name = PROJECT_NAME;

        if($user->save()) {
            $verification_url = url('/verification'.'/'.$user_id.'/'.$verification_code);
            //return $verification_url;
            // echo $verification_url; die;

            if (!filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
                Mail::send('emails.email_verification_by_link', ['name'=>$name, 'verification_url'=>$verification_url], function($message) use ($email,$company_name)
                {
                    $message->to($email, $company_name)->subject('LovePush Email Verification'); 
                });
                // return 'Email sent to '.$name.' successfully.'; 
            } 
        }
        // return false;
    }

    public static function sendWelcomeEmail($user_id = null) {

        $user = WebUser::select('id','name','email')->where('id',$user_id)->first();
        if(!empty(@$user->email)){

            $to_email     = $user->email;
            $company_name = PROJECT_NAME;

            // $email_format = Email::getEmail('registeraton');
            // $content = $email_format->content;
            // $subject = $email_format->subject;

            // $content = str_replace('{{$first_name}}', $user->first_name, $content);
            // $content = str_replace('{{$last_name}}', $user->last_name, $content);

            $subject = 'Your registration was successful!';
            $name    = $user->name;
        
            if (!filter_var($to_email, FILTER_VALIDATE_EMAIL) === false) {   
                Mail::send('emails.registration_email_to_user',
                    ['name' => $name], 
                    function($message) use ($to_email,$company_name,$subject){
                        $message->to($to_email,$company_name)->subject($subject);
                    }
                );
            } 
        }   
    }
}	
