<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubscriptionPlan extends Model
{
	
	public static function getPlans() { 

        $plans  =  SubscriptionPlan::where('status',1)->get();
        return $plans;
    }

    public static function getPlanInfo($plan_id) {

    	$plan  =  SubscriptionPlan::where('id', $plan_id)
								->where('status',1)
								->first();

        return $plan;	
    }


    public static function editPlan($data, $plan_id) {

        // echo "<pre>"; print_r($data); die;
        $update = SubscriptionPlan::find($plan_id);
        // echo "<pre>"; print_r($update); die;

        if(isset($data['no_of_likes'])) {
            $update->no_of_likes    = $data['no_of_likes'];
        }
        if(isset($data['no_of_chat_req'])) {
            $update->no_of_chat_req = $data['no_of_chat_req'];
        }

        $update->price          = $data['price'];
        if($update->save()) {
            return true;
        } else {
            return false;
        }

    }

}
