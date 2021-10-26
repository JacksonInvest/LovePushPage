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
use App\QbChatDialogId;
use App\ChatStatus;
use App\BlockList;
use App\ReportChat;
use App\Traits\PushNotification;

class MatchController extends Controller
{   
    use PushNotification;

    public function myMatches(Request $request) {

        $validator = Validator::make($request->all(),[
            "user_id"   => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        } 

        $my_user_id = Auth::id();

        $user_id = $request->user_id;

        // $qb_chat_dialogIds = QbChatDialogId::pluck('match_id');

        // Get matches with chat dialogId (no chat in b/w) -> Not used

        $reported_users = ReportChat::where('user_id',$my_user_id)->pluck('reported_user_id')->toArray();
        $reporting_users = ReportChat::where('reported_user_id',$my_user_id)->pluck('user_id')->toArray();
        $report_users = array_merge($reported_users,$reporting_users);

        //print_r($report_users);die;

        $m_without_dialog = Match::
                            // orWhere('user_id', $request->user_id)
                            // ->orWhere('like_by_me', $request->user_id)
                            orWhere(function($query) use($user_id) {
                                $query->where('user_id', $user_id);
                                $query->where('status', 1);
                            })
                            ->orWhere(function($query) use($user_id) {
                                $query->where('like_by_me', $user_id);
                                $query->where('status', 1);
                            })

                            //->with('userInfo1')
                            ->with(['userInfo1' => function($query) use($report_users){
                                $query->whereNotIn('id', $report_users);
                            }])
                            ->has('userInfo1')
                            //->with('userInfo2')
                            ->with(['userInfo2' => function($query) use($report_users){
                                $query->whereNotIn('id', $report_users);
                            }])
                            ->has('userInfo2')
                            ->with('qbChatDialog')
                            //->whereNotIn('user_id', $report_users)
                            //->whereNotIn('like_by_me', $report_users)
                            // ->doesntHave('qbChatDialog')
                            // ->whereDoesntHave('qbChatDialog', function ($q) { 
                            //     })

                            // ->whereNotIn('id', $qb_chat_dialogIds)
                            // ->paginate(15);
                            ->get();
        $isDeleted = 0;
        $deletedBy = 0;
        $blockedBy = 0;
        

        foreach($m_without_dialog as $match){
            //Custom
            
          
            //checking isDeleted status
            if($my_user_id != $match->user_id){
                $isDeleted = $chat_status = ChatStatus::where(['match_id'=>$match->id])->where(['user_id'=>$match->user_id])->value('isDeleted');
                $match['isDeleted'] = (int)$isDeleted;
            }
            if($my_user_id != $match->like_by_me){
                $isDeleted = $chat_status = ChatStatus::where(['match_id'=>$match->id])->where(['user_id'=>$match->like_by_me])->value('isDeleted');
                $match['isDeleted'] = (int)$isDeleted;
            }

            //checking deletedBy status
            $deletedDetail = ChatStatus::where(['match_id'=>$match->id])->where(['user_id'=>$my_user_id])->where(['isDeleted'=>'1'])->first();
            if($deletedDetail){
                if($my_user_id == $match->user_id){
                    $deletedBy = $match->like_by_me;
                }
                if($my_user_id == $match->like_by_me){
                    $deletedBy = $match->user_id;
                }
            }
            else{
                $deletedBy = 0;
            }

            $match['deletedBy'] = (int)$deletedBy;

            //checking Block status
            $other_user_id = "";
            $isBlocked = 0;
            if($my_user_id == $match->user_id){
                $other_user_id = $match->like_by_me;
            }
            if($my_user_id == $match->like_by_me){
                $other_user_id = $match->user_id;
            }
            $check_block = BlockList::where(['user_id'=>$my_user_id])->where(['blocked_user_id'=>$other_user_id])->first();
            if($check_block){
                $isBlocked = 1;
            }
            $match['isBlocked'] = $isBlocked;

            //checking blockedBy status
            $blockedDetail = BlockList::where(['blocked_user_id'=>$my_user_id])->where(['user_id'=>$other_user_id])->select('user_id')->first();
            if($blockedDetail){
                $blockedBy = $blockedDetail['user_id'];
            }
            else{
                $blockedBy = 0;
            }

            $match['blockedBy'] = (int)$blockedBy;
        }

        
       /* $m_with_dialog  = Match::
                            // orWhere('user_id', $request->user_id)
                            // ->orWhere('like_by_me', $request->user_id)
                            orWhere(function($query) use($user_id) {
                                $query->where('user_id', $user_id);
                                $query->where('status', 1);
                            })
                            ->orWhere(function($query) use($user_id) {
                                $query->where('like_by_me', $user_id);
                                $query->where('status', 1);
                            })

                            ->with('userInfo1')
                            ->has('userInfo1')
                            ->with('userInfo2')
                            ->has('userInfo2')
                            ->with('qbChatDialog')
                            ->has('qbChatDialog')
                            // ->whereHas('qbChatDialog', function($query) use($user_id){
                            //     // $query->where('from_user_id','!=',$user_id);
                            // })
                            ->get();*/
                            // ->paginate(15);     

        $connect_count = ConnectRequest::where('to_user_id',$my_user_id)->where('status','S')->count();
        $chat_count = ChatRequest::where('to_user_id',$my_user_id)->where('status','S')->count();
        $likes = Like::where('to_user_id',$my_user_id)->where('status',1)->get();
        $like_count = 0;
        if($likes){
            foreach($likes as $like){
                $exist = Like::where('from_user_id',$my_user_id)->where('to_user_id',$like['from_user_id'])->where('status',1)->first();
                if(!$exist){
                    $like_count = $like_count + 1;
                }
            }
        }
        $request_count = $connect_count + $chat_count + $like_count;
        
        if($m_without_dialog->count()){
            foreach ($m_without_dialog as $k => $v) {
                if(!count($v->userInfo1) || !count($v->userInfo2)){
                    unset($m_without_dialog[$k]);
                }
            }
            $m_without_dialog = array_values($m_without_dialog->toArray());
        }                 
        

        return response()->json([
            'status'  => true,
            'message' => 'Match List.',
            'requests'=> $chat_count,
            'data'    => $m_without_dialog,
                // [
                //     'match_without_dialogId' => $m_without_dialog,
                //     'match_with_dialogId'    => $m_with_dialog,
                // ],
        ],200);
    } 

    public function chatList(Request $request) {

        $validator = Validator::make($request->all(),[
            "user_id"   => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        } 

        $user_id = $request->user_id;

        $m_without_dialog = Match::
                            orWhere(function($query) use($user_id) {
                                $query->where('user_id', $user_id);
                                $query->where('status', 1);
                            })
                            ->orWhere(function($query) use($user_id) {
                                $query->where('like_by_me', $user_id);
                                $query->where('status', 1);
                            })

                            ->with('userInfo1')
                            ->has('userInfo1')
                            ->with('userInfo2')
                            ->has('userInfo2')
                            ->with('qbChatDialog')
                           
                            ->get();
        return response()->json([
            'status'  => true,
            'message' => 'Match List.',
            'data'    => $m_without_dialog,
        ],200);
    } 


    //save qb chat dialog ids
    public function saveQbDialogId(Request $request) {

        $validator = Validator::make($request->all(),[
            "match_id"     => 'required',
            "qb_dialog_id" => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }

        $exist = QbChatDialogId::where('match_id', $request->match_id)->first();
        if($exist) {

             /*$QbChatDialog = QbChatDialogId::with(['matchInfo' => function($query){
                                                    $query->select('id','event_type');
                                                }])
                                                ->where('id', $exist->id)
                                                ->first();

             return response()->json([
                    'status'  => true,
                    'message' => 'QbChatDialog Data.',
                    'data'    => $QbChatDialog
                ],200);*/

            return response()->json([
                'status'  => false,
                'message' => trans('api.already_exist'),
            ],400);
        } else {

            $add = new QbChatDialogId;
            $add->match_id     = $request->match_id;
            $add->qb_dialog_id = $request->qb_dialog_id;
            if($add->save()) {
                $QbChatDialog = QbChatDialogId::with(['matchInfo' => function($query){
                                                    $query->select('id','event_type');
                                                }])
                                                ->where('id', $add['id'])
                                                ->first();
                $matchdetails = Match::where(['id'=>$request->match_id])->select('user_id','like_by_me')->first();
                ChatStatus::insertGetid(['match_id'=>$request->match_id,'user_id'=>$matchdetails['user_id']]);
                ChatStatus::insertGetid(['match_id'=>$request->match_id,'user_id'=>$matchdetails['like_by_me']]);
                return response()->json([
                    'status'  => true,
                    'message' => trans('api.add_success'),
                    'data'    => $QbChatDialog,
                ],200);
            } else {
                return response()->json([
                    'status'  => false,
                    'message' => trans('api.something_went_wrong'),
                ],400);
            }
        }
    }

    public function deleteQbDialogId(Request $request) {

        $validator = Validator::make($request->all(),[
            "ids"     => 'required',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => false,
                'message'=>$validator->errors()->first()
            ],400);
        }

        $ids = explode(',', $request->ids);

        $delete = QbChatDialogId::whereIn('id', $ids)->delete();
        if($delete) {
            return response()->json([
                'status'  => true,
                'data'    => $delete,
                'message' => trans('api.delete_success'),
            ],200);
        } else {
            return response()->json([
                'status' => false,
                'message'=> trans('api.something_went_wrong'), 
            ],400);
        }
    }

    public function updateChatStatus(Request $request) {

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


        $update = QbChatDialogId::where('id', $request->id)->update(['chat_status' => $request->status]);
        if($update) {
            return response()->json([
                'status'  => true,
                'data'    => $update,
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


    public function deleteMatchRecord(Request $request) {

        $validator = Validator::make($request->all(),[
            "match_id" => 'required|exists:matches,id',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 

        $match = Match::where('id', $request->match_id)->first();

        // echo "<pre>"; print_r($match); die;
        $from_user_id = $match->user_id;
        $to_user_id   = $match->like_by_me;

        if($match->event_type == 'L') { //Like(Date) request

            $date_req = Like::orWhere(function($query) use($from_user_id,$to_user_id) {
                                    $query->where('from_user_id', $from_user_id);
                                    $query->where('to_user_id', $to_user_id);
                                })
                                ->orWhere(function($query) use($from_user_id,$to_user_id) {
                                    $query->where('from_user_id', $to_user_id);
                                    $query->where('to_user_id', $from_user_id);
                                })
                                // ->get()
                                ->delete();

            Like::updateLikeRequestString($from_user_id, $to_user_id);

            Match::where('id', $request->match_id)->delete();
            // echo "<pre>"; print_r($date_req);

            //Update in User 

        } else if($match->event_type == 'C') { //Connect request

            $connect_req = ConnectRequest::orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $from_user_id);
                                        $query->where('to_user_id', $to_user_id);
                                    })
                                    ->orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $to_user_id);
                                        $query->where('to_user_id', $from_user_id);
                                    })
                                    ->delete();
                                    // ->toArray();

            // echo "<pre>"; print_r($connect_req); die;

            ////Update in Users connect string
            ConnectRequest::updateConnectRequestString($from_user_id, $to_user_id);
            Match::where('id', $request->match_id)->delete();

        } else if($match->event_type == 'M') { //Chat messaging request

            $chat_req = ChatRequest::orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $from_user_id);
                                        $query->where('to_user_id', $to_user_id);
                                    })
                                    ->orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $to_user_id);
                                        $query->where('to_user_id', $from_user_id);
                                    })
                                    // ->get();
                                    ->delete();
                
            ////Update in Users chat string                                
            ChatRequest::updateChatRequestString($from_user_id, $to_user_id);

            Match::where('id', $request->match_id)->delete();

        } else {

        }

        return response()->json([
            'status'  => true,
            'data'    => '',
            'message' => 'Success.',
            // 'message' => trans('api.user.update_setting_success'),
        ],200);

    }

    public function unmatch(Request $request) {

        $validator = Validator::make($request->all(),[
            "match_id" => 'required|exists:matches,id',
        ]);

        if($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ],400);
        } 

        $match = Match::where('id', $request->match_id)->first();

        // echo "<pre>"; print_r($match); die;
        $from_user_id = $match->user_id;
        $to_user_id   = $match->like_by_me;

        //removing from like array
        Like::updateLikeRequestIds($to_user_id,$from_user_id);
        Like::updateLikeRequestIds($from_user_id,$to_user_id);
        Like::updateLikeRequestString($to_user_id,$from_user_id);
        Like::updateLikeRequestString($from_user_id,$to_user_id);

        //removing from connect array
        ConnectRequest::updateConnectRequestIds($to_user_id,$from_user_id);
        ConnectRequest::updateConnectRequestIds($from_user_id,$to_user_id);
        ConnectRequest::updateConnectRequestString($to_user_id,$from_user_id);
        ConnectRequest::updateConnectRequestString($from_user_id,$to_user_id);

        //removing from chat array
        ChatRequest::updateChatRequestIds($to_user_id,$from_user_id);
        ChatRequest::updateChatRequestIds($from_user_id,$to_user_id);
        ChatRequest::updateChatRequestString($to_user_id,$from_user_id);
        ChatRequest::updateChatRequestString($from_user_id,$to_user_id);

        if($match->event_type == 'L') { //Like(Date) request

            $date_req = Like::orWhere(function($query) use($from_user_id,$to_user_id) {
                                    $query->where('from_user_id', $from_user_id);
                                    $query->where('to_user_id', $to_user_id);
                                })
                                ->orWhere(function($query) use($from_user_id,$to_user_id) {
                                    $query->where('from_user_id', $to_user_id);
                                    $query->where('to_user_id', $from_user_id);
                                })
                                // ->get()
                                ->delete();

            //Like::updateLikeRequestString($from_user_id, $to_user_id);

            Match::where('id', $request->match_id)->delete();
            // echo "<pre>"; print_r($date_req);

            //Update in User 

        } else if($match->event_type == 'C') { //Connect request

            $connect_req = ConnectRequest::orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $from_user_id);
                                        $query->where('to_user_id', $to_user_id);
                                    })
                                    ->orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $to_user_id);
                                        $query->where('to_user_id', $from_user_id);
                                    })
                                    ->delete();
                                    // ->toArray();

            // echo "<pre>"; print_r($connect_req); die;

            ////Update in Users connect string
            //ConnectRequest::updateConnectRequestString($from_user_id, $to_user_id);
            Match::where('id', $request->match_id)->delete();

        } else if($match->event_type == 'M') { //Chat messaging request

            $chat_req = ChatRequest::orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $from_user_id);
                                        $query->where('to_user_id', $to_user_id);
                                    })
                                    ->orWhere(function($query) use($from_user_id,$to_user_id) {
                                        $query->where('from_user_id', $to_user_id);
                                        $query->where('to_user_id', $from_user_id);
                                    })
                                    // ->get();
                                    ->delete();
                
            ////Update in Users chat string                                
            //ChatRequest::updateChatRequestString($from_user_id, $to_user_id);

            Match::where('id', $request->match_id)->delete();

        } else {

        }

        return response()->json([
            'status'  => true,
            'data'    => '',
            'message' => 'Success.',
            // 'message' => trans('api.user.update_setting_success'),
        ],200);

    }
}
