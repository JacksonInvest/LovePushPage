<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ReportChat extends Model
{
	protected $table = "report_chat";

	public function userInfo1() {
		return $this->belongsTo('App\User', 'user_id', 'id')->where('status',1)
					->select('id','name','email','profile_image','quickblox_id','receive_notification');
	}

	public function userInfo2() {
		return $this->belongsTo('App\User', 'reported_user_id', 'id')->where('status',1)
					->select('id','name','email','profile_image','quickblox_id','receive_notification','isBlocked');
	}
}	
