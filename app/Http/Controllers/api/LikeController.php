<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Auth;
use App\User;
use App\Like;
use App\ConnectRequest;
use App\ChatRequest;
use App\Match;
use App\Notification;
use App\UserPlanDetails;
use App\Traits\PushNotification;

class LikeController extends Controller
{   
    use PushNotification;

    public function likeDislike1(Request $request) {

        $validator = Validator::make($request->all(),[
            "from_user_id" => 'required',
            "to_user_id"   => 'required',
            "status"       => 'required|in:1,0', //1=like, 0=dislike
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        } 

        $from_user_id  = $request->from_user_id;     //Login person(from)
        $to_user_id    = $request->to_user_id; //
        $status        = $request->status;    //1=Like, 0=Dislike

        $check_disabled = User::where(['id'=>$request->to_user_id])->where(['receive_like_request'=>'0'])->first();
        if($check_disabled){
            return response()->json([
                'status' => false,
                'message'=> 'User has disabled like request.'
            ],400); 
        }

        $exist = ConnectRequest::where('from_user_id', $request->from_user_id)
                                ->where('to_user_id', $request->to_user_id)
                                ->first();
        $exist1 = ChatRequest::where('from_user_id', $request->from_user_id)
                                ->where('to_user_id', $request->to_user_id)
                                ->first();

        if($exist) {
            return response()->json([
                'status' => false,
                'message'=> 'You have already sent a connect request.'
            ],400);  
        }
        else if($exist1) {
            return response()->json([
                'status' => false,
                'message'=> 'You have already sent a chat request.'
            ],400);  
        }

        $check_status = Like::where('from_user_id', $from_user_id)->where('to_user_id', $to_user_id)->first();
        if(!empty($check_status)) {
            
            $update = Like::where('id', $check_status->id)->update(['status'=> $status]);
            if($update) {

                $likes_str = Like::getLikeDislikeString($from_user_id,$to_user_id); //sort the like-dislike string in the users table (column name = like_user_ids)
                User::where('id',$from_user_id)->update(['like_user_ids' => $likes_str]);

                //check match found
                if($status == '1') {

                    //------- Save Notification 
                    Notification::saveNotification('S_L_R', $check_status->id, $from_user_id, $to_user_id);
                    
                    //Get User notification Status
                    // $notification_status = User::getUserNotificationStatus($request->to_user_id);
                    // if($notification_status == 1) {
                        /*Like Notification*/
                        // $this->PushNotify($to_user_id, $from_user_id, $check_status->id, 'L');
                    // }

                    //check already liked to me
                    $check = Like::where('from_user_id', $to_user_id)
                                    ->where('to_user_id', $from_user_id)
                                    ->where('status','1')
                                    ->first();
                    if(!empty($check)) {
                        $already_matched = Match::orWhere('user_id', $check->from_user_id)
                                                        ->orWhere('like_by_me', $check->to_user_id)
                                                        ->orWhere('user_id', $check->to_user_id)
                                                        ->orWhere('like_by_me', $check->from_user_id)
                                                        ->first();
                        if(empty($already_matched)) {                   

                            $match = new Match;
                            $match->user_id    = $from_user_id;
                            $match->like_by_me = $to_user_id;
                            $match->status     = 1;
                            $match->event_type = 'L';
                            if($match->save()) {
                                
                                //Send match pushNotification to both users
                                // $this->PushNotify($to_user_id, $from_user_id, $match->id, 'M');

                                $matched_user_data = User::getUserById($match->like_by_me);
                                $matchDetails = Match::where('id',$match->id)->with('userInfo1')->has('userInfo1')->with('userInfo2')->has('userInfo2')->first();
                                $matched_user_data['matchDetails'] = $matchDetails;
                                Notification::saveNotification('A_L_R', $check_status->id, $from_user_id, $to_user_id);
                                return response()->json([
                                    'status' => true,
                                    'message'=> trans('api.user.match_found'), 
                                    'data' => $matched_user_data,
                                ],200);
                            }
                        }
                    }
                }
                else if($status == '0'){
                    //Make send request Notificatin inactive
                    Notification::makeNotificationInactive('S_L_R', $check_status->id);
                }

                return response()->json([
                    'status' => true,
                    'message'=> 'Updated successfully',
                    'data' => '',
                ],200);

            } else {
                return response()->json([
                    'status' => false,
                    'message'=> trans('api.something_went_wrong'), 
                ],400);
            }
        } else {

            $like               = new Like;
            $like->from_user_id = $from_user_id;
            $like->to_user_id   = $to_user_id;
            $like->status       = $status;
            if($like->save()) {

                $likes_str = Like::getLikeDislikeString($from_user_id,$to_user_id); //sort the like-dislike string in the users table (column name = like_user_ids)
                User::where('id',$from_user_id)->update(['like_user_ids' => $likes_str]);


                //check match found

                //check already liked to me
                $check = Like::where('from_user_id', $like->to_user_id)
                                ->where('to_user_id', $like->from_user_id)
                                ->where('status','1')
                                ->first();
                if($like->status == '1') {

                    //------- Save Notification 
                    Notification::saveNotification('S_L_R', $like->id, $from_user_id, $to_user_id);

                    /*Like Notification*/
                    // $this->PushNotify($to_user_id, $from_user_id, $like->id, 'L');

                    
                    
                    if(!empty($check)) {

                        $match = new Match;
                        $match->user_id    = $from_user_id;
                        $match->like_by_me = $to_user_id;
                        $match->status     = 1;
                        $match->event_type = 'L';
                        if($match->save()) {
                            //Send match pushNotification to both users
                            // $this->PushNotify($to_user_id, $from_user_id, $match->id, 'M');

                            $matched_user_data = User::getUserById($match->like_by_me);
                            $matchDetails = Match::where('id',$match->id)->with('userInfo1')->has('userInfo1')->with('userInfo2')->has('userInfo2')->first();
                            $matched_user_data['matchDetails'] = $matchDetails;
                            Notification::saveNotification('A_L_R', $like->id, $from_user_id, $to_user_id);

                            //Make send request Notificatin inactive
                            Notification::makeNotificationInactive('S_L_R', $check->id);
                            return response()->json([
                                'status' => true,
                                'message'=> trans('api.user.match_found'), 
                                'data' => $matched_user_data,
                            ],200);
                        }
                    }
                }
                else if($like->status == '0'){
                    //Make send request Notificatin inactive
                    Notification::makeNotificationInactive('S_L_R', $check->id);
                }

                return response()->json([
                    'status' => true,
                    'message'=> 'Updated successfully',
                    'data'   => '',
                ],200);
            } else {
                return response()->json([
                    'status' => false,
                    'message'=> trans('api.something_went_wrong'), 
                ],400);
            }
        }   
    }   

    public function likeDislike(Request $request) {

        $validator = Validator::make($request->all(),[
            "from_user_id" => 'required',
            "to_user_id"   => 'required',
            "status"       => 'required|in:1,0', //1=like
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        } 
        \Log::debug('LIKEDIS from_user_id'.$request->from_user_id.'to_user_id'.$request->to_user_id.'status'.$request->status);

        $from_user_id  = $request->from_user_id;     //Login person(from)
        $to_user_id    = $request->to_user_id; //
        $status        = $request->status;    //1=Like, 0=Dislike

        $ISSEND_exist = Like::where(['from_user_id'=>$to_user_id])->where(['to_user_id'=>$from_user_id])->where(['status'=>1])->first();
        //Change 18 NOV
        if(empty($ISSEND_exist)){
            $check_disabled = User::where(['id'=>$request->to_user_id])->where(['receive_like_request'=>'0'])->first();
            if($check_disabled){
                return response()->json([
                    'status' => false,
                    'message'=> 'User has disabled date request.'
                ],400); 
            }
        }
        
        //Before 18NOV
       /* $check_disabled = User::where(['id'=>$request->to_user_id])->where(['receive_like_request'=>'0'])->first();
            if($check_disabled){
                return response()->json([
                    'status' => false,
                    'message'=> 'User has disabled date request.'
                ],400); 
            }*/

        $like_exist = Like::where('from_user_id', $to_user_id)->where('to_user_id', $from_user_id)->where('status',1)->first();
        if($like_exist){
            if($status == 0){
                //like request decline
                Like::where(['id'=>$like_exist->id])->delete();
                Notification::makeNotificationInactive('S_L_R', $like_exist->id);
                Like::updateLikeRequestIds($to_user_id,$from_user_id);
                return response()->json([
                        'status' => true,
                        'message'=> 'User disliked successfully',
                        'data'   => null,
                    ],200);
            }
            else if($status == 1){
                //like request accept
                $exist = Like::where(['from_user_id'=>$from_user_id])->where(['to_user_id'=>$to_user_id])->where(['status'=>1])->first();
                if($exist){
                    return response()->json([
                        'status' => false,
                        'message'=> 'You already accepted this Date request.'
                    ],400); 
                }
                else{
                    $see_love_requests = UserPlanDetails::where('user_id',$from_user_id)->value('see_love_requests');
                    if($see_love_requests == "Unlimited"){
                        $result = $this->likeRequestAccept($from_user_id, $to_user_id, $like_exist->id);
                        if($result){
                            return response()->json([
                                'status' => true,
                                'message'=> trans('api.user.match_found'), 
                                'data' => $result,
                            ],200);
                        }
                        else{
                            return response()->json([
                                'status' => false,
                                'message'=> trans('api.something_went_wrong'), 
                            ],400);
                        }
                    }
                    else{
                        $see_love_requests = (int)$see_love_requests;
                        if($see_love_requests > 0){
                            $result = $this->likeRequestAccept($from_user_id, $to_user_id, $like_exist->id);
                            if($result){
                                $new_see_love_requests = $see_love_requests - 1;
                                UserPlanDetails::where('user_id',$from_user_id)->update(['see_love_requests'=>$new_see_love_requests]);
                                return response()->json([
                                    'status' => true,
                                    'message'=> trans('api.user.match_found'), 
                                    'data' => $result,
                                ],200);
                            }
                            else{
                                return response()->json([
                                    'status' => false,
                                    'message'=> trans('api.something_went_wrong'), 
                                ],400);
                            }
                        }
                        else{
                            return response()->json([
                                'status' => false,
                                'message'=> 'Your qouta for sending requests is over. You can upgrade your plan to send more requests.'
                            ],400);
                        }
                    }
                }
            }
        }
        else{
            if($status == 0){
                //dislike user
                $exist = Like::where('from_user_id', $from_user_id)->where('to_user_id', $to_user_id)->where('status',0)->first();
                if($exist){
                    return response()->json([
                        'status' => true,
                        'message'=> 'User already disliked.',
                        'data'   => null,
                    ],200);
                }
                else{
                    $like               = new Like;
                    $like->from_user_id = $from_user_id;
                    $like->to_user_id   = $to_user_id;
                    $like->status       = 0;
                    if($like->save()) {
                        $likes_str = Like::getLikeDislikeIds($from_user_id,$to_user_id);
                        User::where('id',$from_user_id)->update(['like_request_ids' => $likes_str]);
                        return response()->json([
                            'status' => true,
                            'message'=> 'User disliked successfully',
                            'data'   => null,
                        ],200);
                    }
                }
            }
            else if($status == 1){
                //sending like request

                $exist = ConnectRequest::where('from_user_id', $request->from_user_id)
                                ->where('to_user_id', $request->to_user_id)
                                ->where('status','S')
                                ->first();
                $exist1 = ChatRequest::where('from_user_id', $request->from_user_id)
                                        ->where('to_user_id', $request->to_user_id)
                                        ->where('status','S')
                                        ->first();

                if($exist) {
                    return response()->json([
                        'status' => false,
                        'message'=> 'You have already sent a Connect request.'
                    ],400);  
                }
                else if($exist1) {
                    return response()->json([
                        'status' => false,
                        'message'=> 'You have already sent a Chat request.'
                    ],400);  
                }
                
                $like_exist = Like::where('from_user_id', $from_user_id)->where('to_user_id', $to_user_id)->where('status',1)->first();
                if($like_exist){
                    return response()->json([
                        'status' => false,
                        'message'=> 'You have already sent a Date request.'
                    ],400);  
                }
                else{
                    $remaining_sending_requests = UserPlanDetails::where('user_id',$from_user_id)->value('sending_requests');
                    if($remaining_sending_requests == "Unlimited"){
                        $result = $this->likeRequest($from_user_id, $to_user_id, $status);
                        if($result){
                            return response()->json([
                                'status' => true,
                                'message'=> 'Date request sent successfully',
                                'data'   => null,
                            ],200);
                        }
                        else{
                            return response()->json([
                                'status' => false,
                                'message'=> trans('api.something_went_wrong'), 
                            ],400);
                        }
                    }
                    else{
                        $remaining_sending_requests = (int)$remaining_sending_requests;
                        if($remaining_sending_requests > 0){
                            $result = $this->likeRequest($from_user_id, $to_user_id, $status);
                            if($result){
                                $new_remaining_sending_requests = $remaining_sending_requests - 1;
                                UserPlanDetails::where('user_id',$from_user_id)->update(['sending_requests'=>$new_remaining_sending_requests]);
                                return response()->json([
                                    'status' => true,
                                    'message'=> 'Date request sent successfully',
                                    'data'   => null,
                                ],200);
                            }
                            else{
                                return response()->json([
                                    'status' => false,
                                    'message'=> trans('api.something_went_wrong'), 
                                ],400);
                            }
                        }
                        else{
                            return response()->json([
                                'status' => false,
                                'message'=> 'Your qouta for sending requests is over. You can upgrade your plan to send more requests.'
                            ],400);
                        }
                    }
                }
            }
        }
    }

    public function likeRequest($from_user_id, $to_user_id, $status){
        $like = new Like;
        $like->from_user_id = $from_user_id;
        $like->to_user_id   = $to_user_id;
        $like->status       = $status;
        if($like->save()) {
            $likes_str = Like::getLikeDislikeIds($from_user_id,$to_user_id);
            User::where('id',$from_user_id)->update(['like_request_ids' => $likes_str]);

            $likes_str = Like::getLikeDislikeIds($to_user_id,$from_user_id);
            User::where('id',$to_user_id)->update(['like_request_ids' => $likes_str]);
            
            Notification::saveNotification('S_L_R', $like->id, $from_user_id, $to_user_id);
            return true;
        }
        else{
            return false;
        }
    }

    public function likeRequestAccept($from_user_id, $to_user_id, $like_exist_id){
        $like = new Like;
        $like->from_user_id = $from_user_id;
        $like->to_user_id   = $to_user_id;
        $like->status       = 1;
        if($like->save()) {
            $match = new Match;
            $match->user_id    = $from_user_id;
            $match->like_by_me = $to_user_id;
            $match->status     = 1;
            $match->event_type = 'L';
            if($match->save()) {
                $likes_str = Like::getLikeDislikeString($from_user_id,$to_user_id);
                User::where('id',$from_user_id)->update(['like_user_ids' => $likes_str]);
                $f_likes_str = Like::getLikeDislikeString($to_user_id,$from_user_id);
                User::where('id',$to_user_id)->update(['like_user_ids' => $f_likes_str]);

                $matched_user_data = User::getUserById($match->like_by_me);
                $matchDetails = Match::where('id',$match->id)->with('userInfo1')->has('userInfo1')->with('userInfo2')->has('userInfo2')->first();
                $matched_user_data['matchDetails'] = $matchDetails;
                Notification::saveNotification('A_L_R', $like->id, $from_user_id, $to_user_id);

                //Make send request Notificatin inactive
                Notification::makeNotificationInactive('S_L_R', $like_exist_id);
                return $matched_user_data;
            }
            else{
                return false;
            }
        }
    }

}
