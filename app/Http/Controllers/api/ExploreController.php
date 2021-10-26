<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Auth;
use App\User;
use App\TestQues;
use App\UserTest;
use App\Traits\PushNotification;
use App\Match;
use App\Like;
use App\ReportChat;
class ExploreController extends Controller
{   
    public function explores(Request $request) {

        /*
        The users who are NOT showing in explores
            1. matched users
            2. send requests users
            3. reported users

        The users who are showing in explores
            1. new users
        */

        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
                'latitude'  => 'required',
                'longitude' => 'required',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user_id = $request->user_id;   
        $user_info = User::where('id', $user_id)->first();

        $lat  = $user_info->latitude;
        $lng = $user_info->longitude;
        if(($request->latitude) || ($request->longitude)) {
            $lat  = $request->latitude;
            $lng = $request->longitude;
        }

        // $test_id = UserTest::where('user_id', $user_id)->value('id');
        // // echo $test_id; die;

        // if(empty($test_id)) {
        //     return response()->json([
        //         'status' => 400,
        //         'message'=> 'Please attempt the personality test.', 
        //     ]);    
        // }
 
        // $queInfo = TestQues::QueAnsInfo($test_id, 1);
        // $result = array_column($queInfo['ansInfo']->toArray(), 'ans_id');
        // // echo "<pre>"; print_r($result); die;
        // $gender_array  = $result;

        

        $like_array    = explode(',', $user_info->like_user_ids); //like and dislike user_ids
        $connect_array = explode(',', $user_info->connect_user_ids); //connect request user_ids if accepted
        $chat_array    = explode(',', $user_info->chat_user_ids); //chat request user_ids if accepted

        $like_request_array    = explode(',', $user_info->like_request_ids); //like and dislike user_ids
        $connect_request_array = explode(',', $user_info->connect_request_ids); //connect request user_ids if accepted
        $chat_request_array    = explode(',', $user_info->chat_request_ids); //chat request user_ids if accepted

        $users = User::select('id','name','username','email','profile_image','gender','age','quickblox_id','receive_notification')
                        ->where('id','!=', $user_id)
                        ->whereNotIn('id', $like_array)
                        ->whereNotIn('id', $connect_array)
                        ->whereNotIn('id', $chat_array)
                        ->whereNotIn('id', $like_request_array)
                        ->whereNotIn('id', $connect_request_array)
                        ->whereNotIn('id', $chat_request_array)
                        // ->whereIn('gender', $gender_array)
                        ->where('email_verified_at','!=', null)
                        ->where('latitude','!=', null)
                        ->where('longitude','!=', null)
                        ->where('status',1)
                        ->where('hide_from_search','0')
                        ->where('is_profile_complete',1)
                        ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$lat, $lng, $lat])
                        ->orderBy('distance','asc')
                        ->when($request->gender, function($query) use ($request) {
                            return $query->where('gender',$request->gender);
                        })
                        ->when($request->min_age, function($query) use ($request) {
                            // return $query->where('age', '>=', $request->age);
                            return $query->whereBetween('age', [$request->min_age, $request->max_age]);
                        })
                        ->with('profileImages')
                        ->inRandomOrder()
                        // ->get();
                        ->paginate(15);
        // echo "<pre>"; print_r($users); die;                        
        if(count($users) > 0)  {
            return response()->json([
                'status' => 200,
                'data'   => $users,
                'message'=> 'Profiles', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Seems like you have to come back later.', 
            ]);
        }         
    }  

    public function radars(Request $request) {

        /*
        The users who are NOT showing in radars
            1. reported users

        The users who are showing in radars
            1. new users
            2. matched users
            3. send requests users
        */

        $validator = Validator::make($request->all(), [
                'user_id'   => 'required',
                // 'address'  => 'nullable',
                'latitude'  => 'required',
                'longitude' => 'required',
                'gender'    => 'nullable',
                'min_age'   => 'nullable',
                'max_age'   => 'nullable',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user_id = $request->user_id;   
        $user_info = User::where('id', $user_id)->first();

        $lat  = $user_info->latitude;
        $lng = $user_info->longitude;
        if(($request->latitude) || ($request->longitude)) {
            $lat  = $request->latitude;
            $lng = $request->longitude;
        }

        //$unLikeIds = Like::where('from_user_id', $user_id)->where('status', 0)->pluck('to_user_id');
                                                                                    
        $like_array    = explode(',', $user_info->like_user_ids); //like and dislike user_ids
        $connect_array = explode(',', $user_info->connect_user_ids); //connect request user_ids if accepted
        $chat_array    = explode(',', $user_info->chat_user_ids); //chat request user_ids if accepted

        $like_request_array    = explode(',', $user_info->like_request_ids); //like and dislike user_ids
        $connect_request_array = explode(',', $user_info->connect_request_ids); //connect request user_ids if accepted
        $chat_request_array    = explode(',', $user_info->chat_request_ids); //chat request user_ids if accepted

        $reported_users = ReportChat::where('user_id',$user_id)->pluck('reported_user_id')->toArray();
        $reporting_users = ReportChat::where('reported_user_id',$user_id)->pluck('user_id')->toArray();
        $report_users = array_merge($reported_users,$reporting_users);

        $users = User::select('id','name','username','email','profile_image','gender','age','quickblox_id','receive_notification')
                        ->where('id','!=', $user_id)
                        ->whereNotIn('id', $like_array)
                        ->whereNotIn('id', $connect_array)
                        ->whereNotIn('id', $chat_array)
                        /*->whereNotIn('id', $like_request_array)
                        ->whereNotIn('id', $connect_request_array)
                        ->whereNotIn('id', $chat_request_array)*/
                        // ->whereIn('gender', $gender_array)
                        ->where('email_verified_at','!=', null)
                        ->where('latitude','!=', null)
                        ->where('longitude','!=', null)
                        ->where('status',1)
                        ->where('hide_from_search','0')
                        ->where('isBlocked','0')
                        ->where('is_profile_complete',1)
                        ->whereNotIn('id', $report_users)
                        //for km
                        ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$lat, $lng, $lat])
                        // ->havingRaw("distance < ?", [$radius])
                        // ->when($request->latitude, function($query) use($lat, $lng) {
                        //     $query->whereRaw("(6371 * acos( cos( radians('$lat') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$lng') ) + sin( radians('$lat') ) * sin( radians(latitude) ) ) ) <= 100");
                        // })
                        ->orderBy('distance','asc')
                        // ->when($request->distanceFilter, function($query) use($request){
                        //     if($request->distanceFilter ==1) {
                        //         $query->orderBy('distance','asc');
                        //     } else if($request->distanceFilter ==2){
                        //         $query->orderBy('distance','desc');
                        //     } else {
                        //         $query;
                        //     }
                        // })
                        ->when($request->gender, function($query) use ($request) {
                            return $query->where('gender',$request->gender);
                        })
                        ->when($request->min_age, function($query) use ($request) {
                            // return $query->where('age', '>=', $request->age);
                            return $query->whereBetween('age', [$request->min_age, $request->max_age]);
                        })
                        // ->with('profileImages')
                        // ->inRandomOrder()
                        // ->get();
                        ->paginate(10);
        // echo "<pre>"; print_r($users); die;                        
        if(count($users) > 0)  {
            return response()->json([
                'status' => 200,
                'data'   => $users,
                'message'=> 'Profiles', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Seems like you have to come back later.', 
            ]);
        }         
    }

    public function searchUser(Request $request){

        /*
        The users who are NOT showing in searchUser
            1. reported users

        The users who are showing in searchUser
            1. new users
            2. matched users
            3. send requests users
        */

        $validator = Validator::make($request->all(), [
                'search_term'   => 'required'
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        $user_id = Auth::id();
        $user_info = User::where('id', $user_id)->first();
        $lat  = $user_info->latitude;
        $lng = $user_info->longitude;

        $search_term = $request->input('search_term');

        $matchIds = Match::
                        orWhere(function($query) use($user_id) {
                            $query->where('user_id', $user_id);
                            $query->where('status', 1);
                        })
                        ->orWhere(function($query) use($user_id) {
                            $query->where('like_by_me', $user_id);
                            $query->where('status', 1);
                        })
                        ->pluck('id');
        if(!empty($matchIds)) {
            $userIds = Match::whereIn('id',$matchIds)->pluck('user_id');
            $likeIds = Match::whereIn('id',$matchIds)->pluck('like_by_me');
            // echo "<pre>"; print_r($userIds);// die;      
            // echo "<pre>"; print_r($likeIds); //die;      
        }

        $matchedUsers = [];
        $matchedUsers = array_merge(json_decode($userIds), json_decode($likeIds));

        foreach (array_keys($matchedUsers, $user_id) as $key) {
            unset($matchedUsers[$key]);
        }

        $like_array    = explode(',', $user_info->like_user_ids); //like and dislike user_ids
        $connect_array = explode(',', $user_info->connect_user_ids); //connect request user_ids if accepted
        $chat_array    = explode(',', $user_info->chat_user_ids); //chat request user_ids if accepted
        

        $filtered_like_array = array_diff($like_array, $matchedUsers);
        $filtered_connect_array = array_diff($connect_array, $matchedUsers);
        $filtered_chat_array = array_diff($chat_array, $matchedUsers);

        $reported_users = ReportChat::where('user_id',$user_id)->pluck('reported_user_id')->toArray();
        $reporting_users = ReportChat::where('reported_user_id',$user_id)->pluck('user_id')->toArray();
        $report_users = array_merge($reported_users,$reporting_users);

        $users = User::select('id','name','username','email','profile_image','gender','age','quickblox_id','receive_notification')
                        ->where('id','!=', $user_id)
                        ->where(function($query) use ($search_term){
                            $query->where('name', 'LIKE', '%'.$search_term.'%');
                            $query->orWhere('username', 'LIKE', '%'.$search_term.'%');
                        })
                        //->where('name','like','%'.$request->input('search_term').'%')
                        //->orwhere('username','like','%'.$request->input('search_term').'%')
                        ->whereNotIn('id', $filtered_like_array)
                        ->whereNotIn('id', $filtered_connect_array)
                        ->whereNotIn('id', $filtered_chat_array)
                        // ->whereIn('gender', $gender_array)
                        ->where('email_verified_at','!=', null)
                        ->where('latitude','!=', null)
                        ->where('longitude','!=', null)
                        ->where('status',1)
                        ->where('hide_from_search','0')
                        ->where('isBlocked','0')
                        ->where('is_profile_complete',1)
                        ->with('profileImages')
                        ->whereNotIn('id', $report_users)
                        ->selectRaw('( 6371 * acos( cos( radians(?) ) *
                               cos( radians( latitude ) )
                               * cos( radians( longitude ) - radians(?)
                               ) + sin( radians(?) ) *
                               sin( radians( latitude ) ) )
                             ) AS distance', [$lat, $lng, $lat])
                        ->orderBy('distance','asc')
                        ->with(['matchInfo1'=> function($query) use($user_id){
                                $query->where('like_by_me',$user_id);
                                $query->with('qbChatDialog');
                            }])
                        ->with(['matchInfo2'=> function($query) use($user_id){
                                $query->where('user_id',$user_id);
                                $query->with('qbChatDialog');
                            }])
                        ->inRandomOrder()
                        // ->get();
                        ->paginate(15);
        if(count($users) > 0)  {
            return response()->json([
                'status' => 200,
                'data'   => $users,
                'message'=> 'Profiles', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Seems like you have to come back later.', 
            ]);
        } 
    } 
}
