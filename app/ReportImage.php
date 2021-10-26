<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ReportImage extends Model
{
	protected $table = "report_images";

	protected $hidden = [
		'created_at','updated_at'
	];

	public function user() {
        return $this->belongsTo('App\User','user_id','id');
    }

    public function reported_user() {
        return $this->belongsTo('App\User','reported_user_id','id');
    }

    public function post() {
        return $this->belongsTo('App\Post','image_id','id');
    }

    public function postad() {
        return $this->belongsTo('App\PostAds','image_id','id');
    }

    public function profile_image() {
        return $this->belongsTo('App\UserProfileImages','image_id','id');
    }
}	
