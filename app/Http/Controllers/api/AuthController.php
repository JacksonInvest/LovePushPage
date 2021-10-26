<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Validator;
use App\User;
use Illuminate\Support\Facades\Hash;
use Auth;
use App\UserProfileImages;
use DB;
use App\UserRequest;
use App\Intention;
use App\Support;
use App\BlockList;
use App\ChatRequest;
use App\ConnectRequest;
use App\Like;
use App\Match;
use App\ReportChat;
use App\Notification;
use App\NotificationDesc;
use App\ChatStatus;
use App\Post;
use App\PostAds;
use App\PostLike;
use App\UserTest;
use App\QbChatDialogId;
use App\TestQues;
use App\TestQuesAns;
use App\TestQuesComparison;
use App\TestScore;
use App\FAQ;
use App\DeletedAccount;
use App\AppLink;
use App\ReportImage;
use App\UserPlanDetails;
use App\Plan as Plans;
use Illuminate\Validation\Rule;
use Twilio\Rest\Client;
use Twilio\Jwt\ClientToken;
use App\Traits\QuickBlox;
use Illuminate\Support\Facades\Mail;
use App\Mail\forgotPasswordEmail;
use Log;

class AuthController extends Controller
{   
    use QuickBlox;

    public function register(Request $request){

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];

        $validator = Validator::make($request->all(), [
                'login_type'    => 'required|in:1,2,3,4',
                //'name'          => 'nullable|max:255',
                'name'          => [
                    'nullable','max:255',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                    // Rule::notIn(array_map("like", $invalidWords)),
                ],
                // 'username'      => 'required|max:255|unique:users|not_in:sex,penis,cock,vagina,pussy,dick',
                'username' => [
                    'required','unique:users',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                    // Rule::notIn(array_map("like", $invalidWords)),
                ],
                'email'         => 'required|email|max:255|unique:users',
                'phone'         => 'nullable|unique:users,phone,null',
                'phone_code'    => 'nullable',
                'password'      => 'required|min:6',
                'gender'        => 'required|in:1,2,3',
                'device_type'   => 'required|in:1,2',
                'device_token'      => 'nullable',
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }


       /* if(in_array(strtoupper($request->username), $invalidWords)) {
            return response()->json([
                'message'=> "The selected username is invalid.", 
                'status' => 400,
            ]);
        }*/
        // echo "11"; die;
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

        try {

            // $check = User::where('username', $request->username)

            if($request->login_type == 1) {

                $myReferalCode = AuthController::random_strings(6);

                $user               = new User;
                $user->name         = ($request->name) ? $request->name : '';
                $user->username     = $request->username;
                $user->email        = $request->email;
                $user->password     = Hash::make($request->password);
                $user->phone        = ($request->phone) ? $request->phone : '';
                $user->phone_code   = ($request->phone_code) ? $request->phone_code : '';
                $user->login_type   = $request->login_type;
                $user->gender       = $request->gender;
                $user->device_type  = $request->device_type;
                $user->device_token = $request->device_token;
                $user->locale       = ($_SERVER['HTTP_LOCALE']) ? $_SERVER['HTTP_LOCALE'] : 'en';
                $user->myReferalCode = strtoupper($myReferalCode);
                $user->referalBy    = ($request->referalBy) ? $request->referalBy : '';
                if($user->save()){

                    // User::sendRegisterationEmail($user->id);
                    User::sendVerificationCodeEmail($user->id);

                    $user_data = User::getUserById($user->id);


                    $tokenResult = $user_data->createToken('user')->accessToken;



                    return response()->json([
                        'status' => 200,
                        'data'   => $user_data,
                        'token'  => $tokenResult,
                        'message'=> trans('api.user.registration_success'), 

                    ]);
                }else{
                    return response()->json([
                        'status' => 400,
                        'message'=> trans('api.user.something_went_wrong'), 

                    ]);
                }
            } else {
                // $validator = Validator::make($request->all(), [
                //     'social_id'    => 'required',
                // ]);
                
                // if ($validator->fails()) {
                //     return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
                // }
            }

        } catch (\Exception $e) {
            $response['status'] = 400;
            $response['message'] = $e->getMessage();
            return $response;
        }
    }

    public function isSocialUser(Request $request){

        //return UserProfileImages::where('user_id','526')->select('image')->first();

        $validator = Validator::make($request->all(), [
                'login_type'    => 'required|in:2,3,4',
                'social_id'     => 'required|max:255',
                'email'         => 'nullable|email'
               
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 

        if($request->login_type == 2 || $request->login_type == 3){
            $exist = User::where('social_id',$request->social_id)->first();
            if(empty($exist) && !empty($request->email)){
                $exist = User::where('email', $request->email)->first();
            }
            $user_data = User::getUserById($exist->id);
            $tokenResult = $user_data->createToken('user')->accessToken;
            if(!empty($exist)){
                return response()->json([
                        'status' => 200,
                        'data'   => $exist,
                        'isSocialUser'=> true,
                        'token'  => $tokenResult
                    ]);
            }else{
                return response()->json([
                        'status' => 400,
                        'isSocialUser'=> false
                    ]);
            }
        }else if($request->login_type == 4){
             $exist = User::where('social_id', $request->social_id)
                        ->where('login_type', $request->login_type)
                        ->first(); 

            if($exist) {
                $user_data = User::getUserById($exist->id);
                if($exist->is_profile_complete){
                   
                    $tokenResult = $user_data->createToken('user')->accessToken;

                    return response()->json([
                            'status' => 200,
                            'data'   => $user_data,
                            'isSocialUser'=> true,
                            'token'  => $tokenResult
                            //'data'   => $user_data,
                        ]);

                    }

                return response()->json([
                        'status' => 200,
                        'data'   => $user_data,
                        'isSocialUser'=> true,
                        //'token'  => $tokenResult
                        //'data'   => $user_data,
                    ]);
            }else{
                return response()->json([
                        'status' => 400,
                        'isSocialUser'=> false
                    ]);
            }
        }
        
        
    }

    public function socailLogin(Request $request) {

        $validator = Validator::make($request->all(), [
                'login_type'    => 'required|in:2,3,4',
                'social_id'     => 'required|max:255',
                'name'          => 'nullable|max:255',
                'username'      => 'nullable',
                'email'         => 'nullable',
                // 'phone'         => 'nullable|numeric',
                // 'phone_code'    => 'nullable',
                // 'gender'        => 'required|in:1,2',
                'device_type'   => 'required|in:1,2',
                'device_token'  => 'nullable',
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }   
        Log::info($request->all());
        /*if($request->email){
            $email = $request->email;
        }
        else{
            $email = "";
        }*/
        //$exist = User::where('email', $email)->first();
        $email = $request->email;

        $exist = User::where('social_id',$request->social_id)->first();
        if(empty($exist)){
            if($email){
                $exist = User::where('email', $email)->first();
            }   
            
        }
        if($exist) {

            if($exist->isBlocked == '0'){
                $user_id             = $exist->id;
                $update              = User::find($user_id);
                $update->login_type  = $request->login_type;
                $update->social_id   = $request->social_id;
                $update->name        = ($request->name) ? $request->name : ''; 
                // $update->username    = $request->username;
                // $update->phone       = $request->phone;
                // $update->phone_code  = $request->phone_code;
                // $update->gender      = $request->gender;
                $update->device_type  = $request->device_type;
                $update->device_token = $request->device_token;
                $update->locale       = ($_SERVER['HTTP_LOCALE']) ? $_SERVER['HTTP_LOCALE'] : 'en';
                $update->verification_code = Null;
                $update->email_verified_at = date('Y:m:d h:i:s');
                if($update->save()) {

                    $user_data = User::getUserById($exist->id);

                    $tokenResult = $user_data->createToken('user')->accessToken;

                    // register in quick blox
                    if(empty($user_data->quickblox_id)){
                        $res = $this->QuickBloxRegistration($user_data);
                        // echo '<pre>'; print_r($res); die;
                        if(@$res['status'] === true){
                            $user_data->quickblox_id = @$res['quickblox_id'];
                        }
                    }

                    $this->activateFreePlan($exist->id);

                    return response()->json([
                        'status' => 200,
                        'token'  => $tokenResult,
                        'data'   => $user_data,
                        'message'=> trans('api.user.login_success'), 
                    ]);
                } else {
                    return response()->json([
                        'status' => 400,
                        'message'=> trans('api.something_went_wrong'), 
                    ]);
                }
            }
            else{
                return response()->json([
                    'status' => 400,
                    'message'=> trans('api.user.user_blocked'), 
                ]);
            }
        } else {

            $myReferalCode = AuthController::random_strings(6);

            $add = new User;
            $add->login_type  = $request->login_type;
            $add->social_id   = $request->social_id;
            $add->name        = $request->name;
            $add->email       = $request->email;
            $add->verification_code = Null;
            $add->email_verified_at = date('Y:m:d h:i:s');
            // $add->username    = $request->username;
            // $add->phone       = $request->phone;
            // $add->phone_code  = $request->phone_code;
            // $add->gender      = $request->gender;
            $add->device_type  = $request->device_type;
            $add->device_token = $request->device_token;
            $add->locale       = ($_SERVER['HTTP_LOCALE']) ? $_SERVER['HTTP_LOCALE'] : 'en';
            $add->myReferalCode = strtoupper($myReferalCode);
            //$user->referalBy    = ($request->referalBy) ? $request->referalBy : '';
            if($add->save()) {

                $user_data = User::getUserById($add->id);

                $tokenResult = $add->createToken('user')->accessToken;

                 // register in quick blox
                if(empty($user_data->quickblox_id)){
                    $res = $this->QuickBloxRegistration($user_data);
                    // echo '<pre>'; print_r($res); die;
                    if(@$res['status'] === true){
                        $user_data->quickblox_id = @$res['quickblox_id'];
                    }
                }

                return response()->json([
                    'status' => 200,
                    'token'  => $tokenResult,
                    'data'   => $user_data,
                    'message'=> trans('api.user.login_success'), 
                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'message'=> trans('api.something_went_wrong'), 
                ]);
            }
        }
    }

    //Email not return by insta, so new api made for insta
    public function instaLogin(Request $request) {

        $validator = Validator::make($request->all(), [
                'login_type'    => 'required|in:4',
                'social_id'     => 'required|max:255',
                'name'          => 'required|max:255',
                //'username'      => 'required|unique:users',
                //'email'         => 'required|email',
                // 'phone'         => 'nullable|numeric',
                // 'phone_code'    => 'nullable',
                // 'gender'        => 'required|in:1,2',
                'device_type'   => 'required|in:1,2',
                'device_token'  => 'nullable',      
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }   
        $email = $request->email;

        $exist = User::where('social_id', $request->social_id)
                        ->where('login_type', $request->login_type)
                        ->first();
        if(empty($exist)){
            if($email){
                $exist = User::where('email', $email)->first();
            }
            
        }
        if($exist) {

            if($exist->isBlocked == '0'){
                $user_id              = $exist->id;
                $update               = User::find($user_id);
                $update->login_type   = $request->login_type;
                $update->social_id    = $request->social_id;
                $update->name         = ($request->name) ? $request->name : ''; 
                $update->device_type  = $request->device_type;
                $update->device_token = $request->device_token;
                $update->locale       = ($_SERVER['HTTP_LOCALE']) ? $_SERVER['HTTP_LOCALE'] : 'en';
                $update->verification_code = Null;
                

                if($request->has('email')){
                    $update->email = $email;
                }
                if($request->has('username')){
                    $update->username = $request->username;
                }
                
                if($request->has('gender')){
                    $update->gender = $request->gender;
                }

                if($update->save()) {

                    $user_data = User::getUserById($exist->id);

                    $tokenResult = $user_data->createToken('user')->accessToken;

                    // register in quick blox
                    if(empty($user_data->quickblox_id)){
                        $res = $this->QuickBloxRegistration($user_data);
                        // echo '<pre>'; print_r($res); die;
                        if(@$res['status'] === true){
                            $user_data->quickblox_id = @$res['quickblox_id'];
                        }
                    }

                    $this->activateFreePlan($exist->id);

                    return response()->json([
                        'status' => 200,
                        'token'  => $tokenResult,
                        'data'   => $user_data,
                        'message'=> trans('api.user.login_success'), 
                    ]);
                } else {
                    return response()->json([
                        'status' => 400,
                        'message'=> trans('api.something_went_wrong'), 
                    ]);
                }
            }
            else{
                return response()->json([
                    'status' => 400,
                    'message'=> trans('api.user.user_blocked'), 
                ]);
            }
        } else {

            $myReferalCode = AuthController::random_strings(6);

            $add = new User;
            $add->login_type  = $request->login_type;
            $add->social_id   = $request->social_id;
            $add->name        = $request->name;
            $add->verification_code = Null;
            $add->device_type = $request->device_type;
            $add->device_token = $request->device_token;
            $add->locale       = ($_SERVER['HTTP_LOCALE']) ? $_SERVER['HTTP_LOCALE'] : 'en';
            $add->myReferalCode = strtoupper($myReferalCode);

            if($request->has('username')){
                $add->username = $request->username;
            }
            

                if($request->has('email')){
                    $add->email = $email ?? $request->email;
                }
                
                
                if($request->has('gender')){
                    $add->gender = $request->gender;
                }

            //$user->referalBy    = ($request->referalBy) ? $request->referalBy : '';
            if($add->save()) {

                $user_data = User::getUserById($add->id);

                $tokenResult = $add->createToken('user')->accessToken;

                // register in quick blox
                if(empty($user_data->quickblox_id)){
                    $res = $this->QuickBloxRegistration($user_data);
                    // echo '<pre>'; print_r($res); die;
                    if(@$res['status'] === true){
                        $user_data->quickblox_id = @$res['quickblox_id'];
                    }
                }

                return response()->json([
                    'status' => 200,
                    'token'  => $tokenResult,
                    'data'   => $user_data,
                    'message'=> trans('api.user.login_success'), 
                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'message'=> trans('api.something_went_wrong'), 
                ]);
            }
        }
    }

    public function random_strings($length_of_string) 
    {
        $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        return substr(str_shuffle($str_result), 0, $length_of_string); 
    }

    //Socail Login time
    public function addUserInfo(Request $request) {

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];
        if($request->login_type == 2){
            $email = $request->email ?? null;
            if(empty($email)){
                $validator = Validator::make($request->all(), [
                        'user_id'    => 'required|exists:users,id',
                        'login_type'    => 'required|in:1,2,3,4',
                        //'email'      => 'required|unique:users,email',
                        //'email'      => 'required|unique:users,email,'.$request->user_id.',id',
                        // 'username'      => 'required|max:255|unique:users|not_in:sex,penis,cock,vagina,pussy,dick',
                        'username' => [
                            'required','unique:users',
                            Rule::notIn(array_map("strtolower", $invalidWords)),
                            Rule::notIn(array_map("strtoupper", $invalidWords)),
                            // Rule::notIn(array_map("like", $invalidWords)),
                        ],
                        // 'email'         => 'required|email|max:255|unique:users',
                        'phone'         => 'nullable',
                        'phone_code'    => 'nullable',
                        'gender'        => 'required|in:1,2,3',
                        'device_type'   => 'required|in:1,2',
                        'device_token'  => 'nullable',  
                    ]
                    // ,[
                    //     'email.exists'      => trans('api.user.user_error'),
                    // ]
                );
            }else{
                $validator = Validator::make($request->all(), [
                'user_id'    => 'required|exists:users,id',
                'login_type'    => 'required|in:1,2,3,4',
                //'email'      => 'required|unique:users,email',
                'email'      => 'required|unique:users,email,'.$request->user_id.',id',
                // 'username'      => 'required|max:255|unique:users|not_in:sex,penis,cock,vagina,pussy,dick',
                'username' => [
                    'required','unique:users',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                    // Rule::notIn(array_map("like", $invalidWords)),
                ],
                // 'email'         => 'required|email|max:255|unique:users',
                'phone'         => 'nullable',
                'phone_code'    => 'nullable',
                'gender'        => 'required|in:1,2,3',
                'device_type'   => 'required|in:1,2',
                'device_token'  => 'nullable',  
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
            );
            }
        }else{
             $validator = Validator::make($request->all(), [
                'user_id'    => 'required|exists:users,id',
                'login_type'    => 'required|in:1,2,3,4',
                //'email'      => 'required|unique:users,email',
                'email'      => 'required|unique:users,email,'.$request->user_id.',id',
                // 'username'      => 'required|max:255|unique:users|not_in:sex,penis,cock,vagina,pussy,dick',
                'username' => [
                    'required','unique:users',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                    // Rule::notIn(array_map("like", $invalidWords)),
                ],
                // 'email'         => 'required|email|max:255|unique:users',
                'phone'         => 'nullable',
                'phone_code'    => 'nullable',
                'gender'        => 'required|in:1,2,3',
                'device_type'   => 'required|in:1,2',
                'device_token'  => 'nullable',  
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
            );
        }
        /*$validator = Validator::make($request->all(), [
                'user_id'    => 'required|exists:users,id',
                'login_type'    => 'required|in:1,2,3,4',
              
                'email'      => 'required|unique:users,email,'.$request->user_id.',id',
              
                'username' => [
                    'required','unique:users',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                  
                ],
              
                'phone'         => 'nullable',
                'phone_code'    => 'nullable',
                'gender'        => 'required|in:1,2,3',
                'device_type'   => 'required|in:1,2',
                'device_token'  => 'nullable',  
            ]
        );*/
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        if(!$this->_checkStringIsValid($request->username, $invalidWords) ) {
            return response()->json([
                'message'=> "The selected username is invalid.", 
                'status' => 400,
            ]);
        }

        $user_id = $request->user_id;
        $update              = User::find($user_id);
        $update->gender      = $request->gender;
        if($request->email != '') {
            $update->email       = $request->email;
        }
        $update->login_type  = $request->login_type;
        $update->username    = $request->username;
        $update->phone       = $request->phone;
        $update->phone_code  = $request->phone_code;
        $update->device_type = $request->device_type;
        $update->device_token = $request->device_token;
        $update->referalBy    = ($request->referalBy) ? $request->referalBy : '';
        if($update->save()) {
                
                $user_data = User::getUserById($user_id);
                
                $tokenResult = $user_data->createToken('user')->accessToken;
                return response()->json([
                    'status' => 200,
                    'token'  => $tokenResult,
                    'data'   => $user_data,
                    'message'=> trans('api.user.login_success'), 
                ]);
        } else {
            return response()->json([
                'status' => 400,
                'message'=> trans('api.something_went_wrong'), 
            ]);
        }
    }

    public function createProfile(Request $request){

        $validator = Validator::make($request->all(), [
                'user_id'               => 'required|exists:users,id',
                'age'               => 'required|numeric',
                'name'                  => 'nullable|max:255',
                'love_push_intention'   => 'nullable',
                'relationship'          => 'nullable|in:1,2,3,4,5',
                'sexual_orientation'    => 'nullable|in:1,2,3',
                'size'                  => 'nullable',
                'physique'              => 'nullable|in:1,2,3,4,5', //new
                'eyecolor'              => 'nullable|max:255',
                'haircolor'             => 'nullable|max:255',
                'education'             => 'nullable|max:255',
                'job'                   => 'nullable',
                'hobbies'               => 'nullable',
                'religion'              => 'nullable',
                'aboutme'               => 'nullable',
                'language'              => 'nullable',
                'profile_image'         => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                // 'employer'              => 'required',
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
        );

        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }  


        try{
            $user  = User::find($request->user_id);
            $user->name  = $request->name;
            $user->age   = $request->age;
            $user->love_push_intention  = $request->love_push_intention;
            $user->relationship         = $request->relationship;
            $user->sexual_orientation   = $request->sexual_orientation;
            $user->size                 = $request->size;
            $user->physique             = $request->physique;
            $user->eyecolor             = $request->eyecolor;
            $user->haircolor            = $request->haircolor;
            $user->education            = $request->education;
            $user->job                  = $request->job;
            $user->hobbies              = $request->hobbies;
            $user->religion             = $request->religion;
            // $user->employer             = $request->employer;
            $user->aboutme              = $request->aboutme;
            $user->language             = $request->language;
            $user->is_profile_complete  = 1;
            // $user->is_phone_verify      = 1;

            if($request->has('profile_image')){
                $image               = $request->file('profile_image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/profile');
                $image->move($destinationPath, $input['imagename']);
                $user->profile_image       = $input['imagename'];

                $profileimages          = new UserProfileImages;
                $profileimages->user_id = $request->user_id;
                $profileimages->image   = $input['imagename'];
                $profileimages->save();
            }

            if($user->save()) {

                $user_data = User::getUserById($request->user_id);

                $tokenResult = $user_data->createToken('user')->accessToken;

                // register in quick blox
                if(empty($user_data->quickblox_id)){
                    $res = $this->QuickBloxRegistration($user_data);
                    // echo '<pre>'; print_r($res); die;
                    if(@$res['status'] === true){
                        $user_data->quickblox_id = @$res['quickblox_id'];
                    }
                }

                //adding free plan to user
                $this->activateFreePlan($request->user_id);

                return response()->json([
                    'status' => 200,
                    'data'   => $user_data,
                    'token'  => $tokenResult,
                    'message'=> trans('api.user.profile_success'), 

                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'message'=> trans('api.something_went_wrong'), 
                ]);
            }
        } catch(\Exception $e){
            return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(), 
            ]);
        }
    }

    public function activateFreePlan($user_id){
        $plan = Plans::where('type','FREE')->first();
        if($plan){
            $exist = UserPlanDetails::where('user_id',$user_id)->first();
            if(!$exist){
                $user_plan_details = new UserPlanDetails;
                $user_plan_details->user_id = $user_id;
                $user_plan_details->plan_id = $plan->plan_id;
                $user_plan_details->type = $plan->type;
                $user_plan_details->name = $plan->name;
                $user_plan_details->price = $plan->price;
                $user_plan_details->messages = $plan->messages;
                $user_plan_details->sending_requests = $plan->sending_requests;
                $user_plan_details->see_love_requests = $plan->see_love_requests;
                $user_plan_details->recommended_profiles = $plan->recommended_profiles;
                $user_plan_details->recommended_profiles_started_at = date('Y-m-d H:i:s');
                $user_plan_details->ads = $plan->ads;
                $user_plan_details->ads_started_at = date('Y-m-d H:i:s');
                $user_plan_details->save();
            }
        }
    }

    public function login(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => [
                'required',
                'email',
                Rule::exists('users')->where(function($query){
                    $query->where('status',1);
                    // $query->where('email_verified_at',1);
                })
            ],
            'password'          => 'required',
            'device_token'      => 'nullable',
            'device_type'       => 'nullable',
            // 'device_unique_id'  => 'nullable'
        ],[
            'email.exists'      => trans('api.user.user_error'),
        ]);

        
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'message'=>$validator->errors()->first(), 
            ]);
        }

        $credentials = request(['email', 'password']);
        if(!Auth::attempt($credentials)){
            return response()->json([
                'status' => 400,
                'message'=> trans('api.user.password_not_matched'), 
            ]);
        }
        $user = Auth::user();

        if($user->isBlocked == '0'){
            //save device fcm token - used for push notifications
            User::saveDevice($request,$user->id);

            $user_data = User::getUserById($user->id);
            $tokenResult = $user->createToken('user')->accessToken;

            // register in quick blox
            if(empty($user_data->quickblox_id)){
                $res = $this->QuickBloxRegistration($user_data);
                // echo '<pre>'; print_r($res); die;
                if(@$res['status'] === true){
                    $user_data->quickblox_id = @$res['quickblox_id'];
                }
            }

            $this->activateFreePlan($user->id);

            return response()->json([
                'status' => 200,
                'token'  => $tokenResult,
                'data'   => $user_data,
                'message'=> trans('api.user.login_success'), 

            ]);
        }
        else{
            return response()->json([
                'status' => 400,
                'message'=> trans('api.user.user_blocked'), 
            ]);
        }
    }


    public function reSendVerificationCode(Request $request){
        
        $validator = Validator::make($request->all(), [
            'email' => [
                'required',
                'email',
                Rule::exists('users')->where(function($query){
                    $query->where('status',1);
                })
            ],
        ],[
            'email.exists'      => trans('api.user.user_error'),
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'message'=>$validator->errors()->first(), 
            ]);
        }
        $user_id = User::where('email', $request->email)->value('id');
        if($user_id) {

            User::sendVerificationCodeEmail($user_id);

            $user_data = User::getUserById($user_id);

            return response()->json([
                'status' => 200,
                'data'   => $user_data,
                'message'=> trans('api.user.otp_send_success'), 

            ],200);
        } else {
            return response()->json([
                'status' => 400,
                'message'=> trans('api.something_went_wrong'), 
            ],200);
        }
    }

    public function verifyCode(Request $request){
        $rules = [
                'user_id' => 'required|numeric|exists:users,id',
                'verification_code' => 'required|exists:users,verification_code'
            ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        try{
            $user_id = $request->user_id;
            $verification_code = $request->verification_code;
            $user = User::find($user_id);
            // if($user->verification_code == trim($verification_code)){
            $user->verification_code = Null;
            $user->email_verified_at = date('Y:m:d h:i:s');
            $user->save();

            $user_data = User::getUserById($user_id);

            // register in quick blox
            if(empty($user_data->quickblox_id)){
                $res = $this->QuickBloxRegistration($user_data);
                // echo '<pre>'; print_r($res); die;
                if(@$res['status'] === true){
                    $user_data->quickblox_id = @$res['quickblox_id'];
                }
            }

            return response()->json([
                'status' => 200,
                'data'   => $user_data,
                'message'=> trans('api.user.email_verify_success'), 

            ],200);
            // }
            // else{
            //     return response()->json([
            //         'status' => 400,
            //         'message'=> trans('api.user.phone_verify_fail'), 

            //     ],200);
            // }

        }catch (\Exception $e) {
           return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(), 
            ],200);
            
        }
    }

    public function  getLovePushIntentions(Request $request) {

        $intentions = Intention::getIntentions();

        return response()->json([
            'status' => 200,
            'data'   => $intentions,
            'message'=> 'Love Push Intentions', 

        ],200);
    }
    
    // public function sendCodeOnPhone($phone){

    //     $verification_code = rand(1111, 9999);
    //     $accountSid = config('app.twilio')['TWILIO_ACCOUNT_SID'];
    //     $authToken  = config('app.twilio')['TWILIO_AUTH_TOKEN'];
    //     $appSid     = config('app.twilio')['TWILIO_APP_SID'];
    //     $client     = new Client($accountSid, $authToken);

    //     try{
    //         // Use the client to do fun stuff like send text messages!
    //         $client->messages->create(
    //         // the number you'd like to send the message to
    //             $phone,
    //             array(
    //                  // A Twilio phone number you purchased at twilio.com/console
    //                 'from' => '+16822047258', 
    //                  // the body of the text message you'd like to send
    //                 'body' => 'Your verification code is: '.$verification_code
    //             )
    //         );

    //         // $response['status'] = 200;
    //         // $response['verification_code'] = $verification_code;
    //         // return $response;

    //         return response()->json([
    //             'status' => 200,
    //             'data'   => {},
    //             'verification_code' => $verification_code,
    //             'message'=> trans('api.user.login_success'), 

    //         ],200);
    //     }catch(\Exception $e){
    //         $response['status'] = 400;
    //         $response['message'] = $e->getMessage();
    //         return $response;
    //     }
    // }

    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {   
        $request->user()->token()->revoke();

        return response()->json([
            'status' => 200,
            'data'   => '',
            'message'=> trans('api.user.logout_success'), 

        ]);
    }

    /*----- below fn's NotUsed ------*/
    public function sendVerificationCode(Request $request){
        $rules = [
                'user_id'   => 'required|numeric|exists:users,id',
                'phone'     => 'required'
            ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 200]);
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


            return response()->json([
                'status' => 200,
                'data'   => $verification_code,
                'message'=> trans('api.user.otp_send_success'), 

            ],200);

            // $response['status'] = 200;
            // $response['verification_code'] = $verification_code;
            // $response['message'] = trans('api.user.otp_send_success');
            // return $response;
        }
        catch (\Exception $e){

            $user = User::find($request->user_id);
            $user->verification_code = $verification_code;
            $user->save();
            
            return response()->json([
                'status' => 400,
                'verification_code'   => $verification_code,
                'message'=> $e->getMessage(), 
            ],200);
            // $response['status'] = 400;
            // $response['message'] = $e->getMessage();
            // return $response;
        }
    }

    //----- Mobile verification
    /*public function verifyCode(Request $request){
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

                return response()->json([
                    'status' => 200,
                    'data'   => $user,
                    'message'=> trans('api.user.phone_verify_success'), 

                ],200);

                // $response['status'] = 200;
                // $response['message'] = trans('api.user.phone_verify_success');
                // $response['user'] = $user;
                // return $response;

            }else{
                return response()->json([
                    'status' => 400,
                    'message'=> trans('api.user.phone_verify_fail'), 

                ],200);
                // $response['status'] = 400;
                // $response['message'] = trans('api.user.phone_verify_fail');
                // return $response;
            }

        }catch (\Exception $e) {
           return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(), 
            ],200);
            
        }
    }*/

    public function forgotPassword(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ],[
            'email.required'=>'Enter valid email address'
        ]);
        if($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        else{
            $userDetails = User::where(['email'=>$request->input('email')])->where('status',1)->where('email_verified_at','!=', null)->first();
            if($userDetails){
                $random_number = $userDetails->id.AuthController::random_strings(6);
                $mailObj = new \stdClass();
                $mailObj->reset_link = url('resetpassword', $random_number);
                $mailObj->receiver = $userDetails->name;
                $update = User::where(['email'=>$request->input('email')])->update([
                    'reset_link' => $random_number
                ]);
                if($update){
                    Mail::to($request->input('email'))->send(new forgotPasswordEmail($mailObj));
                    return response()->json([
                        'status' => 200,
                        'message'=> 'Link has been sent to your mail to reset password', 
                    ]); 
                }
            }
            else{
                return response()->json([
                    'status' => 400,
                    'message'=> 'Email not exist.', 
                ]);
            }
        }
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

    public function referalTree(Request $request){
        $levels = [];
        $user_id = Auth::user()->id;
        $myReferalCode = User::where(['id'=>$user_id])->value('myReferalCode');
        $level1 = User::where('email_verified_at','!=', null)
                ->where('status',1)
                ->where(['referalBy'=>$myReferalCode])
                ->with(['matchInfo1'=> function($query) use($user_id){
                        $query->where('like_by_me',$user_id);
                        $query->with('qbChatDialog');
                    }])
                ->with(['matchInfo2'=> function($query) use($user_id){
                        $query->where('user_id',$user_id);
                        $query->with('qbChatDialog');
                    }])
                ->select('id','name','username','email','profile_image','gender','age','quickblox_id','myReferalCode','referalBy')
                ->get();
        if(count($level1)){
            $levels['level1'] = $level1;
            $referalCodes1 = [];
            foreach($level1 as $level){
                $referalCodes1[] = $level['myReferalCode'];
            }

            $level2 = User::where('email_verified_at','!=', null)
                            ->where('status',1)
                            ->whereIn('referalBy',$referalCodes1)
                            ->with(['matchInfo1'=> function($query) use($user_id){
                                    $query->where('like_by_me',$user_id);
                                    $query->with('qbChatDialog');
                                }])
                            ->with(['matchInfo2'=> function($query) use($user_id){
                                    $query->where('user_id',$user_id);
                                    $query->with('qbChatDialog');
                                }])
                            ->select('id','name','username','email','profile_image','gender','age','quickblox_id','myReferalCode','referalBy')
                            ->get();
            if(count($level1)){
                $levels['level2'] = $level2;
                $referalCodes2 = [];
                foreach($level2 as $level){
                    $referalCodes2[] = $level['myReferalCode'];
                }

                $level3 = User::where('email_verified_at','!=', null)
                                ->where('status',1)
                                ->whereIn('referalBy',$referalCodes2)
                                ->with(['matchInfo1'=> function($query) use($user_id){
                                    $query->where('like_by_me',$user_id);
                                    $query->with('qbChatDialog');
                                }])
                                ->with(['matchInfo2'=> function($query) use($user_id){
                                    $query->where('user_id',$user_id);
                                    $query->with('qbChatDialog');
                                }])
                                ->select('id','name','username','email','profile_image','gender','age','quickblox_id','myReferalCode','referalBy')
                                ->get();
                if(count($level3)){
                    $levels['level3'] = $level3;
                    $referalCodes3 = [];
                    foreach($level3 as $level){
                        $referalCodes3[] = $level['myReferalCode'];
                    }

                    $level4 = User::where('email_verified_at','!=', null)
                                    ->where('status',1)
                                    ->whereIn('referalBy',$referalCodes3)
                                    ->with(['matchInfo1'=> function($query) use($user_id){
                                        $query->where('like_by_me',$user_id);
                                        $query->with('qbChatDialog');
                                    }])
                                    ->with(['matchInfo2'=> function($query) use($user_id){
                                        $query->where('user_id',$user_id);
                                        $query->with('qbChatDialog');
                                    }])
                                    ->select('id','name','username','email','profile_image','gender','age','quickblox_id','myReferalCode','referalBy')
                                    ->get();
                    if(count($level4)){
                        $levels['level4'] = $level4;
                        $referalCodes4 = [];
                        foreach($level4 as $level){
                            $referalCodes4[] = $level['myReferalCode'];
                        }

                        $level5 = User::where('email_verified_at','!=', null)
                                        ->where('status',1)
                                        ->whereIn('referalBy',$referalCodes4)
                                        ->with(['matchInfo1'=> function($query) use($user_id){
                                            $query->where('like_by_me',$user_id);
                                            $query->with('qbChatDialog');
                                        }])
                                        ->with(['matchInfo2'=> function($query) use($user_id){
                                            $query->where('user_id',$user_id);
                                            $query->with('qbChatDialog');
                                        }])
                                        ->select('id','name','username','email','profile_image','gender','age','quickblox_id','myReferalCode','referalBy')
                                        ->get();
                        if(count($level5)){
                            $levels['level5'] = $level5;
                        }
                    }
                }
            }
        }

        if($levels) {
            return response()->json([
                'status' => 200,
                'data'   => $levels,
                'message'=> 'levels', 
            ]);
        } else {
            return response()->json([
                'status' => 400,
                'data'   => null,
                'message'=> 'No team found', 
            ]);
        }
    }

    public function hideFromSearch(Request $request) {

        $validator = Validator::make($request->all(),[
            "id"     => 'required',
            'status' => 'required|in:1,0', //1=on, 0=off
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 


        $update = User::where('id', $request->id)->update(['hide_from_search' => $request->status]);
        if($update) {
            return response()->json([
                'status'  => true,
                'message' => 'Success.',
                // 'message' => trans('api.user.update_setting_success'),
            ],200);
        } else {
            return response()->json([
                'status' => false,
                'message'=> trans('api.something_went_wrong'), 
            ],400);
        }
    }

    public function setLikeRequest(Request $request) {

        $validator = Validator::make($request->all(),[
            "id"     => 'required',
            'status' => 'required|in:1,0', //1=on, 0=off
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 


        $update = User::where('id', $request->id)->update(['receive_like_request' => $request->status]);
        if($update) {
            return response()->json([
                'status'  => true,
                'message' => 'Success.',
                // 'message' => trans('api.user.update_setting_success'),
            ],200);
        } else {
            return response()->json([
                'status' => false,
                'message'=> trans('api.something_went_wrong'), 
            ],400);
        }
    }

    public function setChatRequest(Request $request) {

        $validator = Validator::make($request->all(),[
            "id"     => 'required',
            'status' => 'required|in:1,0', //1=on, 0=off
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 


        $update = User::where('id', $request->id)->update(['receive_chat_request' => $request->status]);
        if($update) {
            return response()->json([
                'status'  => true,
                'message' => 'Success.',
                // 'message' => trans('api.user.update_setting_success'),
            ],200);
        } else {
            return response()->json([
                'status' => false,
                'message'=> trans('api.something_went_wrong'), 
            ],400);
        }
    }

    public function setNotification(Request $request) {

        $validator = Validator::make($request->all(),[
            "id"     => 'required',
            'status' => 'required|in:1,0', //1=on, 0=off
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 


        $update = User::where('id', $request->id)->update(['receive_notification' => $request->status]);
        if($update) {
            return response()->json([
                'status'  => true,
                'message' => 'Success.',
                // 'message' => trans('api.user.update_setting_success'),
            ],200);
        } else {
            return response()->json([
                'status' => false,
                'message'=> trans('api.something_went_wrong'), 
            ],400);
        }
    }

    public function support(Request $request){
        $validator = Validator::make($request->all(),[
            "name"     => 'required',
            'subject' => 'required',
            'message' => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 
        $name   = $request->input('name');
        $subject =$request->input('subject');
        $message = $request->input('message');
        $insert = Support::insertGetId([
            'name' => $name,
            'subject' => $subject,
            'message' => $message,
            'created_at' => date('Y:m:d H:i:s'),
        ]);

        if($insert){
            $to_email     = 'support@love-push.com';
            $company_name = PROJECT_NAME;

            $subject = $subject;
        
            if (!filter_var($to_email, FILTER_VALIDATE_EMAIL) === false) {   
                Mail::send('emails.support',
                    ['c_email' => $name, 'c_subject' => $subject, 'c_message' => $message], 
                    function($message) use ($to_email,$company_name,$subject){
                        $message->to($to_email,$company_name)->subject($subject);
                    }
                );

                return response()->json([
                    'status'  => true,
                    'message' => 'Success.',
                ],200);
            } 
        }

    }

    public function getSettings(Request $request){
        $user_id = Auth::user()->id;
        $settings = User::where(['id'=>$user_id])->select('hide_from_search','receive_like_request','receive_chat_request','receive_notification')->first();
        return response()->json([
            'status'  => true,
            'message' => 'Success',
            'settings'=> $settings
        ],200);
    }

    public function checkBlock(Request $request){
        $user = Auth::user();
        if($user->isBlocked == '0'){
            return response()->json([
                'status'  => true,
                'blocked' => 'Success.',
                'isBlocked'=>'0'
            ],200);
        }
        else{
            return response()->json([
                'status'  => true,
                'blocked' => 'Success.',
                'isBlocked'=>'1'
            ],200);
        }
    }

    public function blockUser(Request $request){
        $validator = Validator::make($request->all(),[
            "user_id"  => 'required',
            "blocked_user_id" => 'required',
            'status' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }
        else{
            if($request->status == "block"){
                $check_block = BlockList::where(['user_id'=>$request->user_id])->where(['blocked_user_id'=>$request->blocked_user_id])->first();
                if(!$check_block){
                    $insert = BlockList::insertGetId([
                        'user_id'=>$request->user_id,
                        'blocked_user_id'=>$request->blocked_user_id
                    ]);
                    if($insert){
                        return response()->json([
                            'status'  => true,
                            'message' => 'User added in blocked list',
                        ],200);
                    }
                    else{
                        return response()->json([
                            'status'  => false,
                            'blocked' => 'Something went wrong. Please try again later.',
                        ],400);
                    }
                }
                else{
                    return response()->json([
                        'status'  => false,
                        'blocked' => 'Already added in blocked list',
                    ],400);
                }
            }
            else if($request->status == "unblock"){
                $check_block = BlockList::where(['user_id'=>$request->user_id])->where(['blocked_user_id'=>$request->blocked_user_id])->first();
                if($check_block){
                    $remove = BlockList::where(['user_id'=>$request->user_id])->where(['blocked_user_id'=>$request->blocked_user_id])->delete();
                    if($remove){
                        return response()->json([
                            'status'  => true,
                            'message' => 'User removed from blocked list',
                        ],200);
                    }
                    else{
                        return response()->json([
                            'status'  => false,
                            'blocked' => 'Something went wrong. Please try again later.',
                        ],400);
                    }
                }
                else{
                    return response()->json([
                        'status'  => false,
                        'blocked' => 'Already removed from blocked list',
                    ],400);
                }
            }
        } 
    }

    public function deleteAccount(Request $request){

        $validator = Validator::make($request->all(),[
            "lang_id"  => 'required',
            "reasons" => 'required',
            'description' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }
        else{
            $user_id = Auth::user()->id;
            $user = User::where(['id'=>$user_id])->first();
            if($user){
                DeletedAccount::insertGetId([
                    'lang_id' => $request->lang_id,
                    'name' => $user->name,
                    'username' => $user->username,
                    'email' => $user->email,
                    'phone_code' => $user->phone_code,
                    'phone' => $user->phone,
                    'reasons' => $request->reasons,
                    'description' => $request->description
                ]);
            }

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

            return response()->json([
                'status'  => true,
                'message' => 'Account deleted successfully',
            ],200);
        }
    }

    public function faq(Request $request){
        $validator = Validator::make($request->all(),[
            "lang_id"     => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        }

        $faq_categoty = FAQ::where('language_id',$request->lang_id)->select('ques_type')->where('status','1')->groupBy('ques_type')->orderBy('id','ASC')->get();
        if(count($faq_categoty)){
            $mainarr = [];
            foreach($faq_categoty as $category){
                $faqs = FAQ::where('language_id',$request->lang_id)->where('status','1')->where('ques_type',$category->ques_type)->get();
                $arr = [
                    'category_name' => $category->ques_type,
                    'qsn_list' => $faqs
                ];
                array_push($mainarr, $arr);
            }

            return response()->json([
                'status'  => true,
                'message' => 'FAQ found',
                'faq' => $mainarr
            ],200);
        }
        else{
            return response()->json([
                'status'  => false,
                'blocked' => 'FAQ not found',
            ],400);
        }

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

    public function appLinks(Request $request){
        $app_links = AppLink::get();
        return response()->json([
            'status'  => true,
            'message' => 'App Links',
            'app_links' => $app_links
        ],200);
    }

    public function reportImage(Request $request){
        $validator = Validator::make($request->all(),[
            "image_id" => 'required',
            'type' => 'required|in:profile_image,post,post_ad'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }
        else{
            //added reported_user_id field in database table
            $reported_user_id = "";
            if($request->type == "profile_image"){
                $reported_user_id = UserProfileImages::where('id',$request->image_id)->value('user_id');
            }
            else if($request->type == "post"){
                $reported_user_id = Post::where('id',$request->image_id)->value('user_id');
            }
            else if($request->type == "post_ad"){
                $reported_user_id = PostAds::where('id',$request->image_id)->value('user_id');
            }
            else{
                $reported_user_id = "";
            }
            $report_image = new ReportImage;
            $report_image->user_id = Auth::user()->id;
            $report_image->reported_user_id = $reported_user_id;
            $report_image->image_id = $request->image_id;
            $report_image->type = $request->type;
            if($report_image->save()){
                return response()->json([
                    'status'  => true,
                    'message' => 'Image has been reported successfully.'
                ],200);
            }
            else{
                return response()->json([
                    'status'  => false,
                    'blocked' => 'Something went wrong. Please try again later.',
                ],400);
            }
        } 
    }
 
}
