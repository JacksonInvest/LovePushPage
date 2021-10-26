<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Auth;
use App\User;
use App\ConnectRequest;
use App\ChatRequest;
use App\Like;
use App\Match;
use App\Notification;
use App\UserPlanDetails;
use App\Traits\PushNotification;

class ConnectController extends Controller
{   
    use PushNotification;

    public function sendConnectRequest(Request $request) {

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

        $from_user_id = $request->from_user_id;
        $to_user_id = $request->to_user_id; 

        \Log::debug('CONNECT from_user_id'.$from_user_id.'to_user_id'.$to_user_id);

        $exist = ConnectRequest::where('from_user_id', $from_user_id)
                                ->where('to_user_id', $to_user_id)
                                ->where('status','S')
                                ->first();
        $exist1 = ChatRequest::where('from_user_id', $from_user_id)
                                ->where('to_user_id', $to_user_id)
                                ->where('status','S')
                                ->first();
        $exist2 = Like::where('from_user_id', $from_user_id)
                            ->where('to_user_id', $to_user_id)
                            ->where('status',1)
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
        else if($exist2) {
            return response()->json([
                'status' => false,
                'message'=> 'You have already sent a Date request.'
            ],400);  
        }

        $remaining_sending_requests = UserPlanDetails::where('user_id',$from_user_id)->value('sending_requests');
        if($remaining_sending_requests == "Unlimited"){
            $result = $this->doConnectRequest($from_user_id, $to_user_id);
            if($result){
                return response()->json([
                    'status' => true,
                    'message'=> 'Connect request send successfully.',
                    'data'   => $result
                ],200);
            }
            else{
                return response()->json([
                    'status' => true,
                    'message'=> 'Request not send.',
                ],400);
            }
        }
        else{
            $remaining_sending_requests = (int)$remaining_sending_requests;
            if($remaining_sending_requests > 0){
                $result = $this->doConnectRequest($from_user_id, $to_user_id);
                if($result){
                    $new_remaining_sending_requests = $remaining_sending_requests - 1;
                    UserPlanDetails::where('user_id',$from_user_id)->update(['sending_requests'=>$new_remaining_sending_requests]);
                    return response()->json([
                        'status' => true,
                        'message'=> 'Connect request send successfully.',
                        'data'   => $result
                    ],200);
                }
                else{
                    return response()->json([
                        'status' => true,
                        'message'=> 'Request not send.',
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

    public function doConnectRequest($from_user_id, $to_user_id){
        $connect = new ConnectRequest;
        $connect->from_user_id = $from_user_id;
        $connect->to_user_id   = $to_user_id;
        $connect->status       = 'S';
        if($connect->save()) {
              
            //------- Save Notification 
            Notification::saveNotification('S_C_R', $connect->id, $from_user_id, $to_user_id);

            //Send Push Notification 
            // $this->PushNotify($request->to_user_id, $request->from_user_id, $connect->id, 'C');
            // $this->notifyAndroidNotification();

            //sort the connect request ids in the users table (column name = connect_request_ids)
            $connect_str = ConnectRequest::getConnectRequestIds($from_user_id,$to_user_id);
            User::where('id',$from_user_id)->update(['connect_request_ids' => $connect_str]);

            $connect_str = ConnectRequest::getConnectRequestIds($to_user_id,$from_user_id);
            User::where('id',$to_user_id)->update(['connect_request_ids' => $connect_str]);

            return $connect;
        } else {
            return false;
        }
    }  


    //Connect Request Accept/Reject
    public function connectRequestStatusUpdate(Request $request) {

        $validator = Validator::make($request->all(),[
            "connect_id" => 'required|exists:connect_requests,id',
            "status"     => 'required|in:A,R',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }

        $exist = ConnectRequest::where('id', $request->connect_id)->where(['status'=>$request->status])->first();
        if($exist){
            if($request->status == 'A') {
                $message = 'accepted';
            }
            else{
                $message = 'rejected';
            }
            return response()->json([
                'status'  => true,
                'message' => 'Connect request already '.$message.'.',
            ],200);
        }
        else{
            $update     = ConnectRequest::where('id', $request->connect_id)->update(['status'=>$request->status]);

            $connect_data = ConnectRequest::getConnectRequest($request->connect_id);

            $connect_id = $connect_data->id;

            if($connect_data->status == 'A') {

                //Save in match table start
                $match = new Match;
                $match->user_id    = $connect_data->from_user_id;
                $match->like_by_me = $connect_data->to_user_id;
                $match->event_type = 'C';
                $match->save();
                //Save in match table end


                //------- Save Notification 
                Notification::saveNotification('A_C_R', $connect_data->id, $connect_data->to_user_id, $connect_data->from_user_id);

                //Make send request Notificatin inactive
                Notification::makeNotificationInactive('S_C_R', $connect_data->id);

                $connect_str = ConnectRequest::getConnectRequestString($connect_data->from_user_id,$connect_data->to_user_id); //sort the connect request string in the users table (column name = connect_user_ids)
                User::where('id',$connect_data->from_user_id)->update(['connect_user_ids' => $connect_str]);

                $f_connect_str = ConnectRequest::getConnectRequestString($connect_data->to_user_id,$connect_data->from_user_id); //sort the connect request string in the users table (column name = connect_user_ids)
                User::where('id',$connect_data->to_user_id)->update(['connect_user_ids' => $f_connect_str]);

                $message = 'accepted';
                // $this->PushNotify($connect_data->from_user_id, $connect_data->to_user_id, $connect_data->id, 'A');
            } else {

                //------- Save Notification 
                // Notification::saveNotification('R_C_R', $connect_data->id, $connect_data->to_user_id, $connect_data->from_user_id);

                $message = 'rejected';
                //Get User notification Status
                // $this->PushNotify($connect_data->from_user_id, $connect_data->to_user_id, $connect_data->id, 'R');

                //Make send request Notificatin inactive
                Notification::makeNotificationInactive('S_C_R', $connect_data->id);
                ConnectRequest::updateConnectRequestIds($connect_data->from_user_id,$connect_data->to_user_id);
            }

            return response()->json([
                'status'  => true,
                'message' => 'Connect request '.$message.' successfully.',
                'data'    => $connect_data,
            ],200);
        }
    } 


    public function notifyAndroidNotification() { //For Android and IOS both
        
        $url = 'https://fcm.googleapis.com/fcm/send';

        $device_token = 'cAFMxu5eDeY:APA91bF4M5IkU9-JKgnOpxI_9wK-0tRdgSVsgzjQdk_hnbMosXJ82CbL1FPNFFXw8Spe67acBhcuoO_s4sm6oYno4woGJCamk13oKJUr5Xi9WBNYO-eyf4L2oMaX-tx5xxAvrJjJ2irp';
        
        $form_user_data = [
            'name'  => 'TEST',
        ];

        $event = 'TESTING';

        $message = [
            'title'      =>  'Testing purpose',
            'body'       =>  "John has send you a connect request",
        ];

        $msg = array(
            'to'            =>  $device_token,
            'notification'  =>  $message,
            'data'          =>  $message
        );
        // prx($message); die;  

        $headers = array(
            'Authorization: key=' . FCM_API_KEY,
            'Content-Type: application/json'
        );
        // Open connection
        $ch = curl_init();

        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($msg));

        // Execute post
        $result = curl_exec($ch);
        if ($result === FALSE) {
            //die('Curl failed: ' . curl_error($ch));
        }
        // Close connection
        curl_close($ch);
        echo '<pre>'; print_r($result);die;
        return  $result;
    }

}
