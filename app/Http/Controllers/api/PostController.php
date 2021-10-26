<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;

use App\User;
use App\Post;
use App\PostLike;
use App\Match;
use App\QbChatDialogId;
use Auth;
use DB;
use App\ChatStatus;
use App\BlockList;
use App\Notification;

class PostController extends Controller
{   
    public function addPost(Request $request){

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];
        
        $rules = [
                'title'                 => [
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                ],
                'description'           => [
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                ],
                'image'                 => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'is_post_anonymously'   => 'required',
            ];
        $validator = Validator::make($request->all(), $rules);
        
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400]);
        }
        try{

            if(!$this->_checkStringIsValid($request->title, $invalidWords) ) {
                return response()->json([
                    'message'=> "Your title contain forbidden words.", 
                    'status' => 400,
                ]);
            }

            if(!$this->_checkStringIsValid($request->description, $invalidWords) ) {
                return response()->json([
                    'message'=> "Your description contain forbidden words.", 
                    'status' => 400,
                ]);
            }

            $post              = new Post;
            $post->user_id     = Auth::id();
            $post->title       = $request->title;
            $post->description = $request->description;
            if (!file_exists(url('/images/post'))) {
                mkdir(url('/images/post'), 0777, true);
            }
            if($request->has('image')){
                $image               = $request->file('image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/images/post');
                $image->move($destinationPath, $input['imagename']);
                $post->image       = $input['imagename'];
            }
            $post->is_post_anonymously = $request->is_post_anonymously;
            $post->save();

            return response()->json([
                'status' => 200,
                'data'   => $post,
                'message'=> trans('api.user.postads_add_success'),

            ]);
        } catch(\Exception $e){
            return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(),

            ]);
        }
    }

    public function myPosts(Request $request){

        $validator = Validator::make($request->all(), [
                'user_id' => 'required|exists:users,id',
            ]
        );
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        $my_user_id = Auth::id();
        $user_id = $request->user_id;

        $posts = Post::with('userInfo')
                        ->has('userInfo')
                        ->orderBy('id','desc')
                        ->with('postLike')
                        ->withCount('postLike')
                        ->where('user_id', $user_id)
                        ->paginate(10);

        $posts->getCollection()
            ->transform(function($rec,$key) use($my_user_id)
            {
                $match_id = Match::where('user_id',$rec->user_id)->where('like_by_me',$my_user_id)->value('id');
                if(!$match_id){
                    $match_id = Match::where('user_id',$my_user_id)->where('like_by_me',$rec->user_id)->value('id');
                }
                $rec->match_id = $match_id;
                $rec->matchInfo = Match::where('id',$match_id)->first();
                $QbChatDialogId = QbChatDialogId::with(['matchInfo' => function($query){
                    $query->select('id','event_type');
                }])->where('match_id', $match_id)->where('chat_status',1)->first();
                if(!empty($QbChatDialogId)) {
                    $rec->matchQbID = $QbChatDialogId;
                }
                else{
                    $rec->matchQbID = null;
                }
                $isLiked = 0;
                $likeDetail = PostLike::where('post_id',$rec->id)->where('user_id',$my_user_id)->where('status',1)->first();
                if($likeDetail){
                    $isLiked = 1;
                }
                $rec->isLiked = $isLiked;

                //checking deletedBy status
                $deletedBy = 0;
                $deletedDetail = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$my_user_id])->where(['isDeleted'=>'1'])->first();
                if($deletedDetail){
                    $deletedBy = $rec->user_id;
                }
                else{
                    $deletedDetail = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$rec->user_id])->where(['isDeleted'=>'1'])->first();
                    if($deletedDetail){
                        $deletedBy = $my_user_id;
                    }
                }
                $rec->deletedBy = (int)$deletedBy;

                //checking blockedBy status
                $blockedDetail = BlockList::where(['blocked_user_id'=>$my_user_id])->where(['user_id'=>$rec->user_id])->select('user_id')->first();
                if($blockedDetail){
                    $blockedBy = $blockedDetail['user_id'];
                }
                else{
                    $blockedDetail = BlockList::where(['blocked_user_id'=>$rec->user_id])->where(['user_id'=>$my_user_id])->select('user_id')->first();
                    $blockedBy = $blockedDetail['user_id'];
                }

                $rec->blockedBy = (int)$blockedBy;

                return $rec;   
            });

        return response()->json([
            'status' => 200,
            'data'   => $posts,
            'message'=> 'Posts list'

        ]);
    }

    public function removePost(Request $request) {

        $validator = Validator::make($request->all(), [
                'id' => 'required|exists:posts,id',
            ]
        );
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 

        $delete = Post::where('id', $request->id)
                            ->where('user_id', Auth::id())
                            ->delete();
        if($delete) {
            return response()->json([
                'status' => 200,
                'data'   => '',
                'message'=> 'Post deleted successfully.'

            ]);
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Not exists.'

            ]);
        }

    }

    public function getPosts() {

        $user_id = Auth::id();

        // echo $user_id; die;
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

         //echo "<pre>"; print_r($matchIds); die;      
        if(!empty($matchIds)) {
            $userIds = Match::whereIn('id',$matchIds)->pluck('user_id');
            $likeIds = Match::whereIn('id',$matchIds)->pluck('like_by_me');
            // echo "<pre>"; print_r($userIds);// die;      
            // echo "<pre>"; print_r($likeIds); //die;      
        }


        $newArray = [];
        $newArray = array_merge(json_decode($userIds), json_decode($likeIds));
        array_push($newArray, $user_id);
        // echo "<pre>"; print_r($newArray); die;  

        $user_ids = Post::whereIn('user_id', $newArray)->orderBy('id','desc')->pluck('user_id');    
        //echo "<pre>";print_r($user_ids);die;

            
        $posts = Post::with('userInfo')
                        ->has('userInfo')           
                        ->orderBy('id','desc')
                        //->where('user_id','!=',Auth::id())
                        //->with('matchUserInfo')
                        // ->with('matchLikeInfo')
                        ->with('postLike')
                        ->withCount('postLike')
                        ->whereIn('user_id', $newArray)
                        // ->get();
                        // ->get()
                        ->paginate(10);
                        // ->map(function($rec) use($matchIds){
                        //     if(!empty($matchIds)) {

                        //         $QbChatDialogId = QbChatDialogId::whereIn('match_id', $matchIds)->where('chat_status',1)->first();
                        //         if(!empty($QbChatDialogId)) {
                        //             $rec->matchQbID = $QbChatDialogId;
                        //         }
                        //     }
                        //     return $rec;
                        // })


        $posts->getCollection()
            ->transform(function($rec,$key) use($user_ids, $user_id)
            {
                if(!empty($user_ids)) {
                    //$match_id = "";
                    $match_id = Match::where('user_id',$rec->user_id)->where('like_by_me',$user_id)->value('id');
                    if(!$match_id){
                        $match_id = Match::where('user_id',$user_id)->where('like_by_me',$rec->user_id)->value('id');
                    }
                    $rec->match_id = $match_id;
                    $rec->matchInfo = Match::where('id',$match_id)->first();
                    $QbChatDialogId = QbChatDialogId::with(['matchInfo' => function($query){
                        $query->select('id','event_type');
                    }])->where('match_id', $match_id)->where('chat_status',1)->first();
                    if(!empty($QbChatDialogId)) {
                        $rec->matchQbID = $QbChatDialogId;
                    }
                    else{
                        $rec->matchQbID = null;
                    }
                    $isLiked = 0;
                    $likeDetail = PostLike::where('post_id',$rec->id)->where('user_id',$user_id)->where('status',1)->first();
                    if($likeDetail){
                        $isLiked = 1;
                    }
                    $rec->isLiked = $isLiked;

                    //checking deletedBy status
                    $deletedBy = 0;
                    $deletedDetail = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$user_id])->where(['isDeleted'=>'1'])->first();
                    if($deletedDetail){
                        $deletedBy = $rec->user_id;
                    }
                    else{
                        $deletedDetail = ChatStatus::where(['match_id'=>$match_id])->where(['user_id'=>$rec->user_id])->where(['isDeleted'=>'1'])->first();
                        if($deletedDetail){
                            $deletedBy = $user_id;
                        }
                    }
                    $rec->deletedBy = (int)$deletedBy;

                    //checking blockedBy status
                    $blockedDetail = BlockList::where(['blocked_user_id'=>$user_id])->where(['user_id'=>$rec->user_id])->select('user_id')->first();
                    if($blockedDetail){
                        $blockedBy = $blockedDetail['user_id'];
                    }
                    else{
                        $blockedDetail = BlockList::where(['blocked_user_id'=>$rec->user_id])->where(['user_id'=>$user_id])->select('user_id')->first();
                        $blockedBy = $blockedDetail['user_id'];
                    }

                    $rec->blockedBy = (int)$blockedBy;

                }
                return $rec;   
            });


        // $posts = Post::with('userInfo')
        //                     ->has('userInfo')
        //                     ->orderBy('id','desc')
        //                     // ->where('user_id','!=',Auth::id())
        //                     ->paginate(10);

        return response()->json([
            'status' => 200,
            'data'   => $posts,
            'message'=> 'Posts list'

        ]);
    }

    public function editPost(Request $request) {

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];

        $rules = [
            'id' => 'required|exists:posts,id',
            'title'                 => [
                Rule::notIn(array_map("strtolower", $invalidWords)),
                Rule::notIn(array_map("strtoupper", $invalidWords)),
            ],
            'description'           => [
                Rule::notIn(array_map("strtolower", $invalidWords)),
                Rule::notIn(array_map("strtoupper", $invalidWords)),
            ],
            'image'                 => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'is_post_anonymously'   => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        
        if($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first(), 'status' => 400],400);
        }
        try{

            if(!$this->_checkStringIsValid($request->title, $invalidWords) ) {
                return response()->json([
                    'message'=> "Your title contain forbidden words.", 
                    'status' => 400,
                ]);
            }

            if(!$this->_checkStringIsValid($request->description, $invalidWords) ) {
                return response()->json([
                    'message'=> "Your description contain forbidden words.", 
                    'status' => 400,
                ]);
            }

            $id = $request->id;
            $post              = Post::find($id);
            $post->user_id     = Auth::id();
            $post->title       = $request->title;
            $post->description = $request->description;
            // if (!file_exists(url('/images/posts'))) {
            //     mkdir(url('/images/posts'), 0777, true);
            // }
            if($request->has('image')){
                $image               = $request->file('image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/images/post');
                $image->move($destinationPath, $input['imagename']);
                $post->image       = $input['imagename'];
            }
            $post->is_post_anonymously = $request->is_post_anonymously;
            $post->save();

            return response()->json([
                'status' => 200,
                'data'   => $post,
                'message'=> trans('api.user.postads_edit_success'),

            ]);
        } catch(\Exception $e){
            return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(),

            ]);
        }
    }

    public function postLikeUnlike(Request $request) {

        $validator = Validator::make($request->all(), [
                'post_id' => 'required|exists:posts,id',
                'user_id' => 'required|exists:users,id',
                'status'  => 'required|in:1,0'
            ]
        );
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 

        $status = $request->status;

        if($status == 1) {
            $message = 'Post like successfully.';
        } else {
            $message = 'Post unlike successfully.';
        }
        $exist = PostLike::where('post_id', $request->post_id)
                            ->where('user_id', $request->user_id)
                            ->first();

        if($exist) {

            PostLike::where('id', $exist->id)->update(['status' => $status]);

            $post_user_id = Post::where('id',$request->post_id)->value('user_id');
            if($post_user_id != Auth::id()){
                if($status == 1){
                    //------- Save Notification 
                    Notification::saveNotification('P_L_R', $request->post_id, $request->user_id, $post_user_id);
                }
            }


            return response()->json([
                'status' => 200,
                'data'   => $exist,
                'message' => $message
                
            ],400);
        } else {
            $add = new PostLike;
            $add->post_id = $request->post_id;
            $add->user_id = $request->user_id;
            $add->status  = $status;
            if($add->save()) {

                $post_user_id = Post::where('id',$request->post_id)->value('user_id');
                if($post_user_id != Auth::id()){
                    if($status == 1){
                        $post_user_id = Post::where('id',$request->post_id)->value('user_id');
                        //------- Save Notification 
                        Notification::saveNotification('P_L_R', $request->post_id, $request->user_id, $post_user_id);
                    }
                }
                return response()->json([
                    'status' => 200,
                    'data'   => $add,
                    'message' => $message
                ],200);
            } else {
                return response()->json([
                    'status' => 400,
                    'message'=> 'Error'
                ],400);
            }
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

}
