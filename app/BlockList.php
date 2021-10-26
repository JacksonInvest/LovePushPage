<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BlockList extends Model
{
	protected $table = "block_list";

	public function userInfo1() {
		return $this->belongsTo('App\User', 'user_id', 'id')->where('status',1)
					->select('id','name','email','profile_image','quickblox_id','receive_notification');
	}

	public function userInfo2() {
		return $this->belongsTo('App\User', 'blocked_user_id', 'id')->where('status',1)
					->select('id','name','email','profile_image','quickblox_id','receive_notification');
	}
}	
