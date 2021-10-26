<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
	public function subscribedPlan() {
        return $this->hasMany('App\PaypalTran');
    }

    public function activeSubscribedPlan() {
        return $this->hasMany('App\PaypalTran')->where('plan_status','1');
    }
}
