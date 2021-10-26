<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;

use App\User;
use App\PostAds;
use App\Match;
use App\QbChatDialogId;
use App\BlockList;
use App\UserPlanDetails;
use Auth;
use DB;

class PostAdsController extends Controller
{

    public function addPostAds(Request $request){

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];
        
        $rules = [
                'title'                 => [
                    'required',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                ],
                'description'           => [
                    'required',
                    Rule::notIn(array_map("strtolower", $invalidWords)),
                    Rule::notIn(array_map("strtoupper", $invalidWords)),
                ],
                'post_type'             => 'required|in:1,2',
                'image'                 => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'location'              => 'required',
                'latitude'              => 'required',
                'longitude'             => 'required',
                'is_post_anonymously'   => 'required',
                'radius'                => 'required'
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

            $remaining = UserPlanDetails::where('user_id',Auth::id())->select('ads')->first();
            if($remaining){
                if($remaining['ads'] == "Unlimited"){
                    $postad = $this->submitPostAds($request);
                    return response()->json([
                        'status' => 200,
                        'data'   => $postad,
                        'message'=> trans('api.user.postads_add_success')
                    ]);
                }
                else{
                    $remaining_ads = $remaining['ads'];
                    $remaining_ads = (int)$remaining_ads;
                    if($remaining_ads > 0){

                        $remaining_ads = $remaining_ads - 1;
                        $remaining_ads = UserPlanDetails::where('user_id',Auth::id())->update(['ads'=>$remaining_ads]);

                        $postad = $this->submitPostAds($request);

                        return response()->json([
                            'status' => 200,
                            'data'   => $postad,
                            'message'=> trans('api.user.postads_add_success')
                        ]);
                    }
                    else{
                        return response()->json([
                            'status' => 400,
                            'message'=> 'Your ads qouta is over.'
                        ],400);
                    }
                }
            }
            else{
                return response()->json([
                    'status' => 400,
                    'message'=> 'Your don\'t have any plan.'
                ],400);
            }

            
        } catch(\Exception $e){
            return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(),

            ]);
        }
    }

    public function submitPostAds($request){
        $postad              = new PostAds;
        $postad->user_id     = Auth::id();
        $postad->title       = $request->title;
        $postad->description = $request->description;
        $postad->post_type   = $request->post_type;
        // if (!file_exists(url('/images/postads'))) {
        //     mkdir(url('/images/postads'), 0777, true);
        // }
        if($request->has('image')){
            $image               = $request->file('image');
            $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
            $destinationPath     = public_path('/images/postads');
            $image->move($destinationPath, $input['imagename']);
            $postad->image       = $input['imagename'];
        }
        $postad->location    = $request->location;
        $postad->latitude    = $request->latitude;
        $postad->longitude   = $request->longitude;
        $postad->is_post_anonymously = $request->is_post_anonymously;
        $postad->radius      = $request->radius;

        $postad->save();

        return $postad;
    }

    public function myPostads(Request $request){

        if(($request->latitude) || ($request->longitude)) {
            $lat  = $request->latitude;
            $lng = $request->longitude;
            $postads = PostAds::with('userInfo')->where('user_id', Auth::id())
                                ->whereRaw('(ST_Distance_Sphere(POINT('.$lng.','.$lat.'), POINT(longitude,latitude))/1000) <= radius')
                                ->orderBy('id','DESC')
                                ->paginate(10);
        }
        else{
            $postads = PostAds::with('userInfo')->where('user_id', Auth::id())->orderBy('id','DESC')->paginate(10);
        }
        
        return response()->json([
            'status' => 200,
            'data'   => $postads,
            'message'=> 'PostAdds list'

        ]);
    }

    public function deletePost(Request $request) {

        $validator = Validator::make($request->all(), [
                'id' => 'required|exists:post_ads,id',
            ]
        );
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        } 

        $delete = PostAds::where('id', $request->id)
                            ->where('user_id', Auth::id())
                            ->delete();
        if($delete) {
            return response()->json([
                'status' => 200,
                'data'   => '',
                'message'=> 'PostAdds deleted successfully.'

            ]);
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Not exists.'

            ]);
        }

    }

    public function getAllPosts(Request $request) {

        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user_id = $request->user_id; 
        $user_info = User::where('id', $user_id)->first();

        $lat  = floatval($user_info->latitude);
        $lng = floatval($user_info->longitude);
        //print_r($lat);echo "<br/>";print_r($lng);die;
        if(($request->latitude) || ($request->longitude)) {
            $lat  = $request->latitude;
            $lng = $request->longitude;
        }

        $postads = PostAds::with('userInfo')
                            ->has('userInfo')
                            //->where('user_id','!=',Auth::id())
                            //->where('approval','1')
                            // ->whereRaw('(ST_Distance_Sphere(POINT('.$lng.','.$lat.'), POINT(longitude,latitude))/1000) <= radius')
                            //->selectRaw('ST_Distance_Sphere(POINT('.$lng.','.$lat.'), POINT(longitude,latitude))/1000 AS aaaa')
                            ->select('*')
                            //->selectRaw("(6371 * acos( cos( radians('$lat') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$lng') ) + sin( radians('$lat') ) * sin( radians(latitude) ) ) ) AS distancee")
                            ->whereRaw("(6371 * acos( cos( radians('$lat') ) * cos( radians(latitude) ) * cos( radians(longitude) - radians('$lng') ) + sin( radians('$lat') ) * sin( radians(latitude) ) ) ) <= radius")
                            ->orderBy('id','DESC')
                            ->paginate(10);
     

        $postads->getCollection()
            ->transform(function($rec,$key) use($user_id)
            {
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
                return $rec;   
            });
        

        if(count($postads)){
            return response()->json([
                'status' => 200,
                'data'   => $postads,
                'message'=> 'PostAdds list'

            ]);
        }
        else{
            return response()->json([
                'status' => 400,
                'data'   => $postads,
                'message'=> 'No Post Ads found'

            ]);
        }
    }

    public function editPostAds(Request $request) {

        $invalidWords = ["sex", "penis", "dick", "cock", "vagina", "pussy", "ass", "fuck", "faggot", "hoe", "slut", "basstard", "sell", "rent", "drugs", "cocaine", "heroin", "lsd", "ketamine", "xtc", "ectasy", "mdma", "schwanz", "schwanz", "arsch", "fick", "schwuchtel", "schlampe", "hure", "verkaufen", "mieten", "drogen", "kokain", "ketamin"];

        $rules = [
            'id' => 'required|exists:post_ads,id',
            'title'                 => [
                'required',
                Rule::notIn(array_map("strtolower", $invalidWords)),
                Rule::notIn(array_map("strtoupper", $invalidWords)),
            ],
            'description'           => [
                'required',
                Rule::notIn(array_map("strtolower", $invalidWords)),
                Rule::notIn(array_map("strtoupper", $invalidWords)),
            ],
            'post_type'             => 'required|in:1,2',
            //'image'                 => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'location'              => 'required',
            'latitude'              => 'required',
            'longitude'             => 'required',
            'is_post_anonymously'   => 'required',
            'radius'                => 'required'
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
            $postad              = PostAds::find($id);
            $postad->user_id     = Auth::id();
            $postad->title       = $request->title;
            $postad->description = $request->description;
            $postad->post_type   = $request->post_type;
            // if (!file_exists(url('/images/postads'))) {
            //     mkdir(url('/images/postads'), 0777, true);
            // }
            if($request->has('image')){
                $image               = $request->file('image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/images/postads');
                $image->move($destinationPath, $input['imagename']);
                $postad->image       = $input['imagename'];
            }
            $postad->location    = $request->location;
            $postad->latitude    = $request->latitude;
            $postad->longitude   = $request->longitude;
            $postad->is_post_anonymously = $request->is_post_anonymously;
            $postad->radius      = $request->radius;
            $postad->save();

            return response()->json([
                'status' => 200,
                'data'   => $postad,
                'message'=> trans('api.user.postads_edit_success'),

            ]);
        } catch(\Exception $e){
            return response()->json([
                'status' => 400,
                'message'=> $e->getMessage(),

            ]);
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

    /*Not Used*/
    // public function postAds(Request $request){
    //     try{
    //         $latitude =  Auth::user()->latitude;
    //         $longitude =  Auth::user()->longitude;
            
    //         if($latitude=='' || $longitude ==''){
    //             $response['status'] = 400;
    //             $response['message'] = 'Please add latitude and longitude first.';
    //             return $response;
    //         }

    //         $post_ids = array();
    //         $posts = array();
    //         $pads_distance = PostAds::select(DB::raw('id, radius,( 6367 * acos( cos( radians('.$latitude.') ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians('.$longitude.') ) + sin( radians('.$latitude.') ) * sin( radians( latitude ) ) ) ) AS distance'))
    //             ->where(function ($query) use ($request) {
    //                 if($request->post_type != ''){
    //                     $query->where('post_type', $request->post_type);
    //                 }
    //             })
    //             ->orderBy('created_at', 'dsc')
    //             ->get();
            
    //         if($pads_distance->count()){
    //             foreach ($pads_distance as $ky => $ve) {
    //                 $p_radius = $ve['radius'];
    //                 $distance = round($ve['distance'], 2);

    //                 if($distance <= $p_radius){
    //                     $post_ids[] = $ve['id'];
    //                 }
    //             }
    //         }

    //         if(count($post_ids)){
    //             $posts = PostAds::whereIn('id', $post_ids)->orderBy('created_at', 'dsc')->paginate(10);
    //         }else{
    //             $posts = PostAds::whereIn('id', [0, -10])->orderBy('created_at', 'dsc')->paginate(10);
    //         }
            
    //         $response['status'] = 200;
    //         $response['posts'] = $posts;
    //         return $response;

    //     }catch(\Exception $e){
    //         $response['status'] = 400;
    //         $response['message'] = $e->getMessage();
    //         return $response;
    //     }
    // }


}
