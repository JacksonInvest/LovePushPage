<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Auth;
use App\User;
use App\ChatRequest;
use App\ConnectRequest;
use App\Like;
use App\Match;
use App\ReportChat;
use App\Notification;
use App\ChatStatus;
use App\Traits\PushNotification;
use App\NotificationDesc;

class ChatReqController extends Controller
{   
    use PushNotification;

    public function sendChatRequest(Request $request) {

        $validator = Validator::make($request->all(),[
            "from_user_id" => 'required',
            "to_user_id"   => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        } 

        $check_disabled = User::where(['id'=>$request->to_user_id])->where(['receive_chat_request'=>'0'])->first();
        if($check_disabled){
            return response()->json([
                'status' => false,
                'message'=> 'User has disabled chat request.'
            ],400); 
        }

        $exist = ChatRequest::where('from_user_id', $request->from_user_id)
                                ->where('to_user_id', $request->to_user_id)
                                ->where('status','S')
                                ->first();
        $exist1 = ConnectRequest::where('from_user_id', $request->from_user_id)
                                ->where('to_user_id', $request->to_user_id)
                                ->where('status','S')
                                ->first();
        $exist2 = Like::where('from_user_id', $request->from_user_id)
                            ->where('to_user_id', $request->to_user_id)
                            ->where('status',1)
                            ->first();

        if($exist) {
            return response()->json([
                'status' => false,
                'message'=> 'You have already sent a Chat request.'
            ],400);  
        }
        else if($exist1) {
            return response()->json([
                'status' => false,
                'message'=> 'You have already sent a Connect request.'
            ],400);  
        }
        else if($exist2) {
            return response()->json([
                'status' => false,
                'message'=> 'You have already sent a Date request.'
            ],400);  
        }

        $c_req               = new ChatRequest;
        $c_req->from_user_id = $request->from_user_id;
        $c_req->to_user_id   = $request->to_user_id;
        $c_req->status       = 'S';
        if($c_req->save()) {
              
            //------- Save Notification 
            Notification::saveNotification('S_M_R', $c_req->id, $request->from_user_id, $request->to_user_id);

            //Send Push Notification 
            // $this->PushNotify($request->to_user_id, $request->from_user_id, $c_req->id, 'S_M_R');

            //sort the connect request string in the users table (column name = chat_request_ids)
            $connect_str = ChatRequest::getChatRequestIds($request->from_user_id,$request->to_user_id);
            User::where('id',$request->from_user_id)->update(['chat_request_ids' => $connect_str]);

            $connect_str = ChatRequest::getChatRequestIds($request->to_user_id,$request->from_user_id);
            User::where('id',$request->to_user_id)->update(['chat_request_ids' => $connect_str]);

            return response()->json([
                'status' => true,
                'message'=> 'Chat request send successfully.',
                'data'   => $c_req
            ],200);
        } else {
            return response()->json([
                'status' => true,
                'message'=> 'Request not send.',
            ],400);
        }
    }  


    //Connect Request Accept/Reject
    public function chatRequestStatusUpdate(Request $request) {

        $validator = Validator::make($request->all(),[
            "chat_id" => 'required|exists:chat_requests,id',
            "status"  => 'required|in:A,R',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }

        $exist = ChatRequest::where('id', $request->chat_id)->where(['status'=>$request->status])->first();
        if($exist){
            if($request->status == 'A') {
                $message = 'accepted';
            }
            else{
                $message = 'rejected';
            }
            return response()->json([
                'status'  => true,
                'message' => 'Chat request already '.$message.'.',
            ],200);
        }
        else{
            $update    = ChatRequest::where('id', $request->chat_id)->update(['status'=>$request->status]);

            $chat_data = ChatRequest::getChatRequest($request->chat_id);

            $chat_id = $chat_data->id;

            if($chat_data->status == 'A') {

                //Save in match table start
                $match = new Match;
                $match->user_id    = $chat_data->from_user_id;
                $match->like_by_me = $chat_data->to_user_id;
                $match->event_type = 'M';
                $match->save();
                //Save in match table end


                //------- Save Notification 
                Notification::saveNotification('A_M_R', $chat_data->id, $chat_data->to_user_id, $chat_data->from_user_id);

                //Make send request Notificatin inactive
                Notification::makeNotificationInactive('S_M_R', $chat_data->id);

                $connect_str = ChatRequest::getChatRequestString($chat_data->from_user_id,$chat_data->to_user_id); //sort the connect request string in the users table (column name = chat_user_ids)
                User::where('id',$chat_data->from_user_id)->update(['chat_user_ids' => $connect_str]);

                $f_connect_str = ChatRequest::getChatRequestString($chat_data->to_user_id,$chat_data->from_user_id); //sort the connect request string in the users table (column name = chat_user_ids)
                User::where('id',$chat_data->to_user_id)->update(['chat_user_ids' => $f_connect_str]);

                $message = 'accepted';
                // $this->PushNotify($chat_data->from_user_id, $chat_data->to_user_id, $chat_data->id, 'A_M_R');
            } else {

                //------- Save Notification 
                // Notification::saveNotification('R_C_R', $chat_data->id, $chat_data->to_user_id, $chat_data->from_user_id);

                $message = 'rejected';
                //Get User notification Status
                // $this->PushNotify($chat_data->from_user_id, $chat_data->to_user_id, $chat_data->id, 'R_M_R');

                //Make send request Notificatin inactive
                Notification::makeNotificationInactive('S_M_R', $chat_data->id);
                ChatRequest::updateChatRequestIds($chat_data->from_user_id,$chat_data->to_user_id);
            }

            return response()->json([
                'status'  => true,
                'message' => 'Chat request '.$message.' successfully.',
                'data'    => $chat_data,
            ],200);
        }
    } 

    public function deleteChat(Request $request){
        $validator = Validator::make($request->all(),[
            "user_id"  => 'required',
            "match_id" => 'required',
            "status"   => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }
        else{
            $update = ChatStatus::where(['match_id'=>$request->match_id])->where(['user_id'=>$request->user_id])->update(['isDeleted'=>$request->status]);
            $message = "";
            if($request->status == "0"){
                $message = "restored";
            }
            else if($request->status == "1"){
                $message = "deleted";
            }
            if($update){
                return response()->json([
                    'status'  => true,
                    'message' => 'User '.$message.' successfully.',
                ],200);
            }
            else{
                return response()->json([
                    'status'  => false,
                    'message' => 'Something went wrong',
                ],400);
            }
        } 
    }

    public function reportChat(Request $request){
        $validator = Validator::make($request->all(),[
            "user_id" => 'required',
            "reported_user_id"   => 'required',
            "message"   => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }
        else{
            $insert = ReportChat::insertGetId([
                'user_id' => $request->user_id,
                'reported_user_id' => $request->reported_user_id,
                'message' => $request->message,
            ]);
            if($insert){
                Notification::where('user_id',$request->user_id)->where('to_user_id',$request->reported_user_id)->update(['status'=>0]);
                Notification::where('user_id',$request->reported_user_id)->where('to_user_id',$request->user_id)->update(['status'=>0]);
                return response()->json([
                    'status'  => true,
                    'message' => 'User reported successfully.',
                ],200);
            }
            else{
                return response()->json([
                    'status'  => false,
                    'message' => 'Something went wrong',
                ],400);
            }
        } 

    }

}
