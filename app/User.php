<?php

namespace App;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\PersonalityTest;
use Illuminate\Support\Facades\Mail;
use Hash;
use Auth;
use App\PaypalTran;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getProfileImageAttribute($value) { //accessor
        if($value) {
            if((strpos($value, "http://") !== false) || (strpos($value, "https://") !== false)){
                return $value;
            }
            else{
                return asset('profile/'.$value);
            }
        } else {
            return asset(SYS_IMG_PATH.'default_user.png');
        }
    }

    public function getActualAttribute($field){ //used in image
        return $this->attributes[$field];
    }

    public function profileImages() {
        return $this->hasMany('App\UserProfileImages');
    }

    public function report_image_user() {
        return $this->hasMany('App\ReportImage');
    }

    public function subscribedPlan() {
        return $this->hasMany('App\PaypalTran');
    }

     public function user_plan_details() {
        return $this->hasOne('App\UserPlanDetails','user_id','id');
    }

    public function userTest() {
        return $this->hasOne('App\UserTest','user_id','id')
                    ->where('user_id','!=', Auth::user()->id);
    }

    public function personalityTest() {
        return $this->hasOne('App\UserTest','user_id','id');
    }

    public function personality_test()
    {
        return $this->hasMany('App\PersonalityTest');
    }

    public static function emailUnique($email = null) {

        //return true if not exists
        //return false if exists

        //username check in user table
        $count = User::where('email',$email)->count();
        if($count > 0) {
            return false;

        } 
        return true;
    }

    public static function sendVerificationCodeEmail($user_id = null) {

        $user = User::select('id','name','email')->where('id',$user_id)->first();
        if(!empty(@$user->email)){
            $to_email     = $user->email;
            $company_name = PROJECT_NAME;

            // $email_format = Email::getEmail('registeraton');
            $otp    = rand ( 1000 , 9999 );
            $update = User::where('id',$user_id)->update(['verification_code' => $otp]);

            $name  = $user->username;
        // echo "<pre>"; print_r($name); die;
            // $content = $email_format->content;
            $subject = PROJECT_NAME.' Account Verification';

            // $content = str_replace('{{$first_name}}', $user->first_name, $content);
            // $content = str_replace('{{$last_name}}', $user->last_name, $content);
            // echo return view('emails.registeraton_email_to_user', compact($name, $otp)); die;

            $data = [
                'name'     => $name,
                'otp'     => $otp,
            ];

            if (!filter_var($to_email, FILTER_VALIDATE_EMAIL) === false) {   
                // echo $to_email; die;
                Mail::send('emails.opt_email_verification', $data, 
                    function($message) use ($to_email,$company_name,$subject){
                        $message->to($to_email,$company_name)->subject($subject);
                    }
                );
                 // dd(Mail::failures());
            } 
        } 
    }

    //send email verification link to website user
    public static function sendEmailVerificationByLink($user_id = null) {

        $user = User::select('id','name','email')->where('id',$user_id)->first();
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

        $user = User::select('id','name','email')->where('id',$user_id)->first();
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

    public static function getUserById($user_id = null) {
        $user = User::where('id', $user_id)
                    ->select('id','name','locale','email','username','phone_code','phone','country','city','address','gender','login_type','social_id','login_type','email_verified_at','love_push_intention','relationship','size','eyecolor','haircolor','education','job','employer','religion','hobbies','sexual_orientation','aboutme','is_restrict_fb_friends','partner_preference','verification_code','is_profile_complete','profile_image','age','physique','quickblox_id','language','myReferalCode','receive_notification')
                    ->with('profileImages')
                    ->with('personalityTest')
                    ->first();

        $user->plan_details = PaypalTran::with('plan')->where('user_id',$user_id)->where('plan_status','1')->select('plan_id')->first();

        return $user;
    }

    public static function getFullUserById($user_id = null, $my_user_id) {
        $user = User::where('id', $user_id)
                    ->select('id','name','locale','email','username','phone_code','phone','country','city','address','gender','login_type','social_id','login_type','email_verified_at','love_push_intention','relationship','size','eyecolor','haircolor','education','job','employer','religion','hobbies','sexual_orientation','aboutme','is_restrict_fb_friends','partner_preference','verification_code','is_profile_complete','profile_image','age','physique','quickblox_id','language','myReferalCode','receive_notification')
                    ->with('profileImages')
                    //->with('subscribedPlan.plan')
                    ->with(['matchInfo1'=> function($query) use($my_user_id){
                                $query->where('like_by_me',$my_user_id);
                                $query->with('qbChatDialog');
                            }])
                    ->with(['matchInfo2'=> function($query) use($my_user_id){
                                $query->where('user_id',$my_user_id);
                                $query->with('qbChatDialog');
                            }])
                    ->with('personalityTest')
                    ->first();

        $user->plan_details = PaypalTran::with('plan')->where('user_id',$user_id)->where('plan_status','1')->select('plan_id')->first();

        return $user;
    }

    public static function addUser($request){
 
        $data = $request->all();
        if(!empty($data['password'])){
            $data['password'] = Hash::make($data['password']);
        } else{
            unset($data['password']);
        }
        unset($data['_token']);
        unset($data['type']);
        // echo "<pre>"; print_r($data); die;

        $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        $myReferalCode = substr(str_shuffle($str_result), 0, 6);

        $user               = new User;
        $user->name         = trim($data['name']);
        $user->username     = $data['username'];
        $user->email        = trim($data['email']);
        $user->password     = $data['password'];
        $user->phone        = $data['phone'];
        //$user->phone_code   = ($data['phone_code']) ? $data['phone_code'] : '';
        $user->login_type   = 1;
        $user->gender       = $data['gender'];
        $user->hobbies       = trim($data['hobbies']);
        $user->aboutme       = trim($data['aboutme']);
        $user->partner_preference       = trim($data['partner_preference']);
        $user->relationship       = trim($data['relationship']);
        $user->status       = trim($data['status']);
        $user->locale       = 'en';
        $user->myReferalCode = strtoupper($myReferalCode);


        /*$data['name']                = trim($data['name']);
        $data['email']               = trim($data['email']);
        $data['phone']               = $data['phone'];
        $data['gender']              = (int)$data['gender'];
        $data['hobbies']             = trim($data['hobbies']);
        $data['aboutme']             = trim($data['aboutme']);
        $data['partner_preference']  = $data['partner_preference'];
        $data['relationship']        = trim($data['relationship']);
        $data['eyecolor']            = trim($data['eyecolor']);
        $data['haircolor']           = trim($data['haircolor']);
        $data['status']              = trim($data['status']);*/
        
        // if ($request->hasFile('image')) {
        //     $image = $request->file('image');
        //     $name  = time().'.'.$image->getClientOriginalExtension();
        //     // $destinationPath = public_path('asset/img/services/');
        //     $destinationPath = base_path(USER_PROFILE_IMG_PATH);

        //     $image->move($destinationPath, $name);
        //     $data['image'] = $name;                 

        //     // $service['image'] = $request->image->store('service');
        // }
        $add = $user->save();

        User::sendVerificationCodeEmail($user->id);

        if($add){ 

            return true;
        } else{
            return false;
        }
    }

    public static function editUser($request,$user_id = null){
 
        $data = $request->all();
        if(!empty($data['password'])){
            $data['password'] = Hash::make($data['password']);
        } else{
            unset($data['password']);
        }
        unset($data['_token']);
        unset($data['email']);
        unset($data['type']);
        unset($data['user_id']); //unset in case of api
        // echo "<pre>"; print_r($data); die;

        if($request->has('love_push_intention')) {
            $love_push_intention = implode(",", $data['love_push_intention']);
        }
        else{
            $love_push_intention = "";
        }

        $data['name']           = trim($data['name']);
        //$data['phone']          = $data['phone'];
        $data['gender']         = $data['gender'];
        $data['hobbies']        = trim($data['hobbies']);
        $data['aboutme']          = trim($data['aboutme']);
        $data['partner_preference']         = $data['partner_preference'];
        $data['love_push_intention']      = $love_push_intention;
        $data['relationship']   = trim($data['relationship']);
        //$data['eyecolor']   = trim($data['eyecolor']);
        //$data['haircolor']   = trim($data['haircolor']);
        //$data['password']       = $data['password'];
        $data['status']         = trim($data['status']);
        
        // if ($request->hasFile('image')) {
        //     $image = $request->file('image');
        //     $name  = time().'.'.$image->getClientOriginalExtension();
        //     // $destinationPath = public_path('asset/img/services/');
        //     $destinationPath = base_path(USER_PROFILE_IMG_PATH);

        //     $image->move($destinationPath, $name);
        //     $data['image'] = $name;                 

        //     // $service['image'] = $request->image->store('service');
        // }

        $updated = User::where('id',$user_id)->update($data);

        if($updated){ 

            //if admin login, then save all images
            // if(Auth::guard('admin')->check()){
            //     //image upload
            //     UserImage::saveUserMainImageByAdmin($request,$user_id); 
            //     UserImage::saveUserMultiImagesByAdmin($request,$user_id); 
            // }

            //resume upload 
            // UserImage::_saveResume($request,$user_id);

            return true;
        } else{
            return false;
        }
    }


    public static function sendContactUsEmail($request) {

        $c_email   = $request->c_email;
        $c_subject = $request->c_subject;
        $c_message = $request->c_message;

        $to_email     = 'support@love-push.com';
        $company_name = PROJECT_NAME;

        $subject = $c_subject;
    
        if (!filter_var($to_email, FILTER_VALIDATE_EMAIL) === false) {   
            Mail::send('emails.contact_us',
                ['c_email' => $c_email, 'c_subject' => $c_subject, 'c_message' => $c_message], 
                function($message) use ($to_email,$company_name,$subject){
                    $message->to($to_email,$company_name)->subject($subject);
                }
            );
        } 
    }


    public static function saveDevice($request,$user_id){

        //device_token update according to user_id
        if(!empty(@$request->device_token)){ 

            $usr_device = User::where('id',$user_id)->first();
            if(!empty($usr_device)){
                $usr_device->device_token = $request->device_token;
                $usr_device->device_type  = $request->device_type;
            } 
            if($usr_device->save()){
                return true;
            } else{
                return false;
            }
        } else{
            return false;
        }
    }

    public function matchInfo1() {
        return $this->hasMany('App\Match', 'user_id');
    }

    public function matchInfo2() {
        return $this->hasMany('App\Match', 'like_by_me');
    }
}
