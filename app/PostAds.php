<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Config;

class PostAds extends Model
{
    //

    public function getImageAttribute($value) {
    	if($value) {
            return asset(Config::get('const.img_path.post_ads').$value); 
            // return asset(config('const.img_path.post_ads').$value); 
    	}
    }

	public function userInfo() {
		return $this->belongsTo('App\User','user_id','id')
					->select('id','email','name','username','profile_image')
					->where('status',1);
	}


    public static function getPosts() {

        $postads = PostAds::with('userInfo')
                            ->has('userInfo')
                            ->orderBy('id','desc')
                            ->get();

        return $postads;
    }

    public static function getPostById($post_id) {

        $postad = PostAds::with('userInfo')
                            ->has('userInfo')
                            ->where('id', $post_id)
                            ->first();

        return $postad;
    }

    public function reported_postad_image() {
        return $this->hasMany('App\ReportImage');
    }

}
