<?php

namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StorePlan;
use App\Plan as Plans;
use App\PaypalTran;
use App\UserPlanDetails;

use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Api\Agreement;
use PayPal\Api\Payer;
use PayPal\Api\PayerInfo;
use PayPal\Api\Plan;
use PayPal\Api\PlanList;
use PayPal\Api\ShippingAddress;
use PayPal\Api\ChargeModel;
use PayPal\Api\Currency;
use PayPal\Api\MerchantPreferences;
use PayPal\Api\PaymentDefinition;
use PayPal\Api\Patch;
use PayPal\Api\PatchRequest;
use PayPal\Common\PayPalModel;

class PlanManagement extends Controller
{
	private $apiContext;
    private $mode;
    private $client_id;
    private $secret;
    private $plan_id;

    public function __construct()
    {
        // Detect if we are running in live mode or sandbox
        if(config('paypal.settings.mode') == 'live'){
            $this->client_id = config('paypal.live_client_id');
            $this->secret = config('paypal.live_secret');
            //$this->plan_id = env('PAYPAL_LIVE_PLAN_ID', '');
        } else {
            $this->client_id = config('paypal.sandbox_client_id');
            $this->secret = config('paypal.sandbox_secret');
            //$this->plan_id = env('PAYPAL_SANDBOX_PLAN_ID', '');
        }
        
        // Set the Paypal API Context/Credentials
        $this->apiContext = new ApiContext(new OAuthTokenCredential($this->client_id, $this->secret));
        $this->apiContext->setConfig(config('paypal.settings'));
    }

	public function plan_list(Request $request){

		$plans = Plans::withCount('activeSubscribedPlan')->get();
		
		return view('backEnd.plan.index', compact('plans'));
	}

	public function plan_details(Request $request, $id){

		$plan = Plans::where('id',$id)->first();

		if($id != "1"){
			$plan->paypal_details = Plan::get($plan->plan_id, $this->apiContext);
		}
		
		return view('backEnd.plan.details', compact('plan'));
	}

	public function plan_edit(Request $request, $id){

		$plan = Plans::where('id',$id)->first();

		if($id != "1"){
			$plan->paypal_details = Plan::get($plan->plan_id, $this->apiContext);
		}
		
		return view('backEnd.plan.form', compact('plan'));
	}

	public function plan_update(Request $request){
		//return redirect('admin/plan_list');

		$request->validate([
			'plan_name' => 'required',
			'plan_price' => 'required',
			'messages' => 'required',
			'sending_requests' => 'required',
			'see_love_requests' => 'required',
			'recommended_profiles' => 'required',
			'ads' => 'required',
		]);

		$plan = Plans::where('id',$request->local_plan_id)->first();
		$plan->name = $request->plan_name;
		$plan->price = $request->plan_price;
		$plan->messages = $request->messages;
		$plan->sending_requests = $request->sending_requests;
		$plan->see_love_requests = $request->see_love_requests;
		$plan->recommended_profiles = $request->recommended_profiles;
		$plan->ads = $request->ads;
		$plan->save();

		return redirect('admin/plan_list')->with('status','Plan updated successfully');
	}

	public function plan_subscriptions(Request $request){
		$active_plans = PaypalTran::with('plan','userInfo')->where('plan_status','1')->get();
		return view('backEnd.plan.user_subscriptions', compact('active_plans'));
	}

}