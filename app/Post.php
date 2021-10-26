<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Config;

class Post extends Model
{
    //

    public function getImageAttribute($value) {
        if($value) {
            return asset(Config::get('const.img_path.post').$value); 
            // return asset(config('const.img_path.post_ads').$value); 
        }
    }

    public function postLike() {
        return $this->hasMany('App\PostLike','post_id','id')
                    ->where('status',1);
    }

    public function userInfo() {
        return $this->belongsTo('App\User','user_id','id')
                    ->select('id','email','name','username','profile_image','quickblox_id','receive_notification')
                    ->where('status',1);
    }

    public function matchUserInfo() {
        return $this->hasOne('App\Match','user_id','user_id');
    }

    public function matchLikeInfo() {
        return $this->hasOne('App\Match','user_id','like_by_me');
    }

    public static function getPosts() {

        $posts = Post::with('userInfo')
                            ->has('userInfo')
                            ->get();

        return $posts;
    }

    public static function getPostById($post_id) {

        $post = Post::with('userInfo')
                            ->has('userInfo')
                            ->where('id', $post_id)
                            ->first();

        return $post;
    }

    public function reported_post_image() {
        return $this->hasMany('App\ReportImage','image_id')->where('type','post');
    }

}
