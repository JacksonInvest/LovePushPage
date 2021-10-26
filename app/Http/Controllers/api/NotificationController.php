<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Auth;
use App\User;
use App\Notification;
use App\NotificationDesc;

class NotificationController extends Controller
{   
    public function notifications(Request $request) {

        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        
        $language_id = $this->getLanguageId();
        
        $notifications = Notification::where('to_user_id', $request->user_id)
                                        ->with('userInfo')
                                        ->has('userInfo')
                                        ->with('eventInfo')
                                        ->with('messEventInfo')
                                        ->with(['notificationMessage' => function($query) use ($language_id) {
                                            $query->where('language_id', $language_id);
                                        }])
                                        ->where('status',1)
                                        ->orderBy('id','desc')
                                        ->get()
                                        ->map(function($rec){
                                            // if(($rec->event_type == 'S_M_R') && ($rec->event_type == 'A_M_R') && ($rec->event_type == 'R_M_R') ) {
                                            //     $rec->event_info = $rec->messEventInfo;
                                            // }
                                            if($rec->event_type == 'S_M_R') {
                                                $rec->event_info = $rec->messEventInfo;
                                            } else if($rec->event_type == 'A_M_R') {
                                                $rec->event_info = $rec->messEventInfo;
                                            } else if($rec->event_type == 'R_M_R') {
                                                $rec->event_info = $rec->messEventInfo;
                                            }
                                             else {
                                                $rec->event_info = $rec->eventInfo;
                                            }
                                            return $rec;
                                        });

        $noti_count = Notification::where('to_user_id', $request->user_id)->where('status',1)->where(['isRead'=>0])->count();


        if(count($notifications) > 0)  {
            return response()->json([
                'status' => 200,
                'noti_count'=>$noti_count,
                'data'   => $notifications,
                'message'=> 'Notifications', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'No record found.', 
            ]);
        }         
    }  

    public function ClearNotifications(Request $request) {
        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $notifications = Notification::where('to_user_id', $request->user_id)
                                        ->where(['event_type'=>'A_M_R'])
                                        ->orWhere(['event_type'=>'A_C_R'])
                                        ->orWhere(['event_type'=>'A_L_R'])
                                        ->update(['status'=>0]);

        return response()->json([
            'status' => 200,
            'message'=> 'Notifications cleared', 
        ]); 
    }

    public function deleteNotification(Request $request) {
        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
                'notification_id' => 'required',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        Notification::where(['id'=>$request->notification_id])->update(['status'=>0]);

        return response()->json([
            'status' => 200,
            'message'=> 'Notification deleted', 
        ]); 
    }

    public function readNotifications(Request $request) {
        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $notifications = Notification::where('to_user_id', $request->user_id)
                                        ->where(['isRead'=>0])
                                        ->where('status',1)
                                        ->update(['isRead'=>1]);

        return response()->json([
            'status' => 200,
            'message'=> 'Notifications read successfully', 
        ]); 
    }
}
