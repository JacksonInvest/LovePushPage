<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaypalTran extends Model
{
	protected $table = "paypal_trans";

	public function userInfo() {
		return $this->belongsTo('App\User','user_id','id');
	}

	public function plan() {
		return $this->belongsTo('App\Plan','plan_id','id');
	}
}
