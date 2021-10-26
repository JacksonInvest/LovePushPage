<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserProfileImages extends Model
{
    //
    public function getImageAttribute($value) { //accessor
        if($value) {
            return asset(USER_PROFILE_IMG_PATH.$value);
        } 
        // else {
        //     return asset(SYS_IMG_PATH.'default_user.png');
        // }
    }

    public function reported_profile_image() {
        return $this->hasMany('App\ReportImage','image_id');
    }

    public function user() {
        return $this->belongsTo('App\User');
    }
}
