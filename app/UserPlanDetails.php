<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPlanDetails extends Model
{
	protected $table = "user_plan_details";

	public function userInfo() {
		return $this->belongsTo('App\User','user_id','id');
	}
}
