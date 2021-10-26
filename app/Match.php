<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Match extends Model
{
	// protected $fillable = [
	// ];
	
	public function userInfo1() {
		return $this->belongsTo('App\User', 'user_id', 'id')->where('status',1)
					->select('id','name','email','profile_image','quickblox_id','receive_notification');
	}

	public function userInfo2() {
		return $this->belongsTo('App\User', 'like_by_me', 'id')->where('status',1)
					->select('id','name','email','profile_image','quickblox_id','receive_notification');
	}

	public function qbChatDialog() {
		return $this->hasOne('App\QbChatDialogId','match_id','id');
	}

}
