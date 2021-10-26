<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Validation\Rule;
use Auth;
use App\SubscriptionPlan;
use App\Plan as Plans;
use App\PaypalTran;
use App\UserPlanDetails;

use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;

// use to process billing agreements
use PayPal\Api\Agreement;
use PayPal\Api\Payer;
use PayPal\Api\PayerInfo;
use PayPal\Api\Plan;
use PayPal\Api\ShippingAddress;
use PayPal\Api\AgreementStateDescriptor;
use PayPal\Api\ChargeModel;
use PayPal\Api\Currency;
use PayPal\Api\MerchantPreferences;
use PayPal\Api\PaymentDefinition;
//use PayPal\Api\Plan;
use PayPal\Api\Patch;
use PayPal\Api\PatchRequest;
use PayPal\Common\PayPalModel;
/*use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;*/

class SubscriptionPlanController extends Controller
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

    public function subscriptionPlans(Request $request) {

        $plans = SubscriptionPlan::getPlans();

        if(count($plans) > 0)  {
            return response()->json([
                'status' => 200,
                'data'   => $plans,
                'message'=> 'Subscription Plans', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'No record found.', 
            ]);
        }         
    }

    public function plans(Request $request){
        $plans = Plans::where('status','1')->get();
        foreach($plans as $plan){
            if($plan['messages'] != 'Unlimited'){
                $plan['messages'] = $plan['messages'].' daily';
            }
            if($plan['sending_requests'] != 'Unlimited'){
                $plan['sending_requests'] = $plan['sending_requests'].' daily';
            }
            if($plan['see_love_requests'] != 'Unlimited'){
                $plan['see_love_requests'] = $plan['see_love_requests'].' daily';
            }
            else{
                $plan['see_love_requests'] = 'See all';
            }
            if($plan['ads'] != 'Unlimited'){
                $plan['ads'] = $plan['ads'].' monthly';
            }
            if($plan['recommended_profiles'] != 'Unlimited'){
                $plan['recommended_profiles'] = $plan['recommended_profiles'].' weekly';
            }
            else{
                $plan['recommended_profiles'] = 'See all';
            }
        }
        if(count($plans) > 0)  {
            return response()->json([
                'status' => 200,
                'data'   => $plans,
                'message'=> 'Subscription Plans', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'No record found.', 
            ]);
        }
    }

    public function paypalRedirect(Request $request){
        $validator = Validator::make($request->all(), [
                'plan_id' => 'required|exists:plans,plan_id',
            ]
        );
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user = Auth::user();

        $existing_plan = PaypalTran::where('user_id',$user->id)->where('plan_status','1')->first();
        if($existing_plan){
            return response()->json([
                'status' => 200,
                'message'=> 'Plan is already running', 
            ]); 
        }
        else{
            // Create new agreement
            $plan_started_at = \Carbon\Carbon::now('Europe/Berlin')->addMinutes(2)->toIso8601String();
            $local_plan_id = Plans::where('plan_id',$request->plan_id)->value('id');
            $agreement = new Agreement();
            $agreement->setName('Lovepush V.I.P Plan Monthly Subscription Agreement')
              ->setDescription('V.I.P Plan Subscription')
              ->setStartDate($plan_started_at);

            // Set plan id
            $plan = new Plan();
            $plan->setId($request->plan_id);
            $agreement->setPlan($plan);

            // Add payer type
            $payer = new Payer();
            $payer->setPaymentMethod('paypal');
            $payer->setPayerInfo(new PayerInfo(array(
                'email' => $user->email,
                'payer_id' => $user->id,
            )));
            $agreement->setPayer($payer);

            $request = clone $agreement;


            try {
                // Create agreement
                $agreement = $agreement->create($this->apiContext);
                //echo "<pre>";print_r($agreement->toArray());die;

                // Extract approval URL to redirect user
                $approvalUrl = $agreement->getApprovalLink();
                $parts = parse_url($approvalUrl);
                parse_str($parts['query'], $query);

                $paypal_trans = new PaypalTran;
                $paypal_trans->user_id = $user->id;
                $paypal_trans->plan_id = $local_plan_id;
                $paypal_trans->plan_started_at = $plan_started_at;
                $paypal_trans->paypal_token = $query['token'];
                $paypal_trans->save();

              //return redirect($approvalUrl);
                return response()->json([
                    'status' => 200,
                    'data'   => $approvalUrl,
                    'message'=> 'Approval URL', 
                ]); 
            } catch (PayPal\Exception\PayPalConnectionException $ex) {
              echo $ex->getCode();
              echo $ex->getData();
              die($ex);
            } catch (Exception $ex) {
              die($ex);
            }
        }
    }

    public function paypalReturn(Request $request){
        $token = $request->token;
        $agreement = new \PayPal\Api\Agreement();

        try {
            // Execute agreement
            $result = $agreement->execute($token, $this->apiContext);

            $paypal_trans = PaypalTran::where('paypal_token',$token)->first();
            if($paypal_trans){
                $paypal_trans->paypal_trans_id = $result->id;
                $paypal_trans->plan_status = '1';
                if($paypal_trans->save()){
                    $plan = Plans::where('id',$paypal_trans->plan_id)->first();
                    if($plan){
                        $user_plan_details = UserPlanDetails::where('user_id',$paypal_trans->user_id)->first();
                        $user_plan_details->plan_id = $plan->plan_id;
                        $user_plan_details->type = $plan->type;
                        $user_plan_details->name = $plan->name;
                        $user_plan_details->price = $plan->price;
                        $user_plan_details->messages = $plan->messages;
                        $user_plan_details->sending_requests = $plan->sending_requests;
                        $user_plan_details->see_love_requests = $plan->see_love_requests;
                        $user_plan_details->recommended_profiles = $plan->recommended_profiles;
                        $user_plan_details->recommended_profiles_started_at = date('Y-m-d H:i:s');
                        $user_plan_details->ads = $plan->ads;
                        $user_plan_details->ads_started_at = date('Y-m-d H:i:s');
                        $user_plan_details->save();
                    }

                    /*return response()->json([
                        'status' => 200,
                        'message'=> 'Plan has been subscribed successfully', 
                    ]);*/
                    echo "Plan has been subscribed successfully";
                }
                else{
                    /*return response()->json([
                        'status' => 400,
                        'message'=> 'Something went wrong', 
                    ]);*/  
                    echo "Something went wrong";
                }
            }
            else{
                /*return response()->json([
                    'status' => 400,
                    'message'=> 'Something went wrong', 
                ]);*/
                echo "Something went wrong"; 
            }

        } catch (\PayPal\Exception\PayPalConnectionException $ex) {
            /*return response()->json([
                'status' => 400,
                'message'=> 'You have either cancelled the request or your session has expired.', 
            ]);*/
            echo "You have either cancelled the request or your session has expired.";
        }
    }

    public function cancel_subscription(Request $request){

        $user = Auth::user();
        $paypal_trans = PaypalTran::where('user_id',$user->id)->where('plan_status','1')->first();
        if($paypal_trans){
            $agreement_id = $paypal_trans['paypal_trans_id'];

            $agreementStateDescriptor = new AgreementStateDescriptor();
            $agreementStateDescriptor->setNote("Suspending the agreement");

            $createdAgreement = Agreement::get($agreement_id, $this->apiContext);

            try {
                $createdAgreement->suspend($agreementStateDescriptor, $this->apiContext);
                $createdAgreement->cancel($agreementStateDescriptor, $this->apiContext);
                $plan_cancelled_at = \Carbon\Carbon::now('Europe/Berlin')->addMinutes(2)->toIso8601String();
                $update = PaypalTran::where('user_id',$user->id)->update(['plan_cancelled_at'=>$plan_cancelled_at,'plan_status'=>'0']);

                //activating free plan at cancel
                $plan = Plans::where('type','FREE')->first();
                if($plan){
                    $user_plan_details = UserPlanDetails::where('user_id',$user->id)->first();
                    $user_plan_details->plan_id = $plan->plan_id;
                    $user_plan_details->type = $plan->type;
                    $user_plan_details->name = $plan->name;
                    $user_plan_details->price = $plan->price;
                    $user_plan_details->messages = $plan->messages;
                    $user_plan_details->sending_requests = $plan->sending_requests;
                    $user_plan_details->see_love_requests = $plan->see_love_requests;
                    $user_plan_details->recommended_profiles = $plan->recommended_profiles;
                    $user_plan_details->recommended_profiles_started_at = date('Y-m-d H:i:s');
                    $user_plan_details->ads = $plan->ads;
                    $user_plan_details->ads_started_at = date('Y-m-d H:i:s');
                    $user_plan_details->save();
                }
                return response()->json([
                    'status' => 200,
                    'message'=> 'Subscription cancelled successfully', 
                ]);
            } 
            catch (Exception $ex) {
                return response()->json([
                    'status' => 400,
                    'message' => "Subscription plan cancellation error",
                ]); 
            }
        }
        else{
            return response()->json([
                'status' => 400,
                'message' => "You have no running subscription plan.",
            ]);
        }
    } 

    public function my_plan_details(Request $request){
        $user = Auth::user();
        $plan_details = UserPlanDetails::where('user_id',$user->id)->first();
        if($plan_details){
            return response()->json([
                'status' => 200,
                'message'=> 'My plan details',
                'data' => $plan_details
            ]);
        }
        else{
            return response()->json([
                'status' => 400,
                'message' => "No plan found",
            ]); 
        }
    }

    public function update_plan_data(Request $request){
        $validator = Validator::make($request->all(), [
            'plan_key' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        else{
            $user = Auth::user();
            $plan_details = UserPlanDetails::where('user_id',$user->id)->first();
            if($plan_details){
                if($request->plan_key == "messages"){
                    $messages = UserPlanDetails::where('user_id',$user->id)->value('messages');
                    if($messages != "Unlimited"){
                        if($messages > 0){
                            $messages = (int)$messages;
                            $new_messages = $messages - 1;
                            UserPlanDetails::where('user_id',$user->id)->update(['messages'=>$new_messages]);
                        }
                    }
                    $new_plan_details = UserPlanDetails::where('user_id',$user->id)->first();
                    return response()->json([
                        'status' => 200,
                        'message'=> 'My plan details',
                        'data' => $new_plan_details
                    ]);
                }
                else if($request->plan_key == "see_love_requests"){
                    $see_love_requests = UserPlanDetails::where('user_id',$user->id)->value('see_love_requests');
                    if($see_love_requests != "Unlimited"){
                        if($see_love_requests > 0){
                            $see_love_requests = (int)$see_love_requests;
                            $new_see_love_requests = $see_love_requests - 1;
                            UserPlanDetails::where('user_id',$user->id)->update(['see_love_requests'=>$new_see_love_requests]);
                        }
                    }
                    $new_plan_details = UserPlanDetails::where('user_id',$user->id)->first();
                    return response()->json([
                        'status' => 200,
                        'message'=> 'My plan details',
                        'data' => $new_plan_details
                    ]);
                }
                else if($request->plan_key == "recommended_profiles"){
                    $recommended_profiles = UserPlanDetails::where('user_id',$user->id)->value('recommended_profiles');
                    if($recommended_profiles != "Unlimited"){
                        if($recommended_profiles > 0){
                            $recommended_profiles = (int)$recommended_profiles;
                            $new_recommended_profiles = $recommended_profiles - 1;
                            UserPlanDetails::where('user_id',$user->id)->update(['recommended_profiles'=>$new_recommended_profiles]);
                        }
                    }
                    $new_plan_details = UserPlanDetails::where('user_id',$user->id)->first();
                    return response()->json([
                        'status' => 200,
                        'message'=> 'My plan details',
                        'data' => $new_plan_details
                    ]);
                }
                else{
                    return response()->json([
                        'status' => 400,
                        'message' => "Wrong plan key",
                    ]);
                }
            }
            else{
                return response()->json([
                    'status' => 400,
                    'message' => "No plan found",
                ]); 
            }
        }
    }

    public function webhook(Request $request){
        $output = \PayPal\Api\WebhookEventType::availableEventTypes($this->apiContext);
        echo "<pre>";print_r($output->toArray());die;
    }
}
