<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Plan as Plans;
use App\PaypalTran;
use App\UserPlanDetails;

class PlanDetails extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:planDetails';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command will reset the plan parameters values on daily, weekly and monthly basis.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $currentDate = date('Y-m-d');
        $currentFullDate = date('Y-m-d H:i:s');
        $user_plans = UserPlanDetails::get();
        if($user_plans){
            foreach($user_plans as $user_plan){
                $nextWeekDate = date('Y-m-d', strtotime($user_plan['recommended_profiles_started_at']. ' + 8 days'));
                $nextMonthDate = date('Y-m-d', strtotime($user_plan['ads_started_at']. ' + 31 days'));
                $plan = Plans::where('plan_id',$user_plan['plan_id'])->first();
                if($plan){
                    $user_plan_details = UserPlanDetails::where('user_id',$user_plan['user_id'])->first();
                    $user_plan_details->messages = $plan->messages;
                    $user_plan_details->sending_requests = $plan->sending_requests;
                    $user_plan_details->see_love_requests = $plan->see_love_requests;
                    if($nextWeekDate <= $currentDate){
                        $user_plan_details->recommended_profiles = $plan->recommended_profiles;
                        $user_plan_details->recommended_profiles_started_at = $currentFullDate;
                    }
                    if($nextMonthDate <= $currentDate){
                        $user_plan_details->ads = $plan->ads;
                        $user_plan_details->ads_started_at = $currentFullDate;
                    }
                    $user_plan_details->save();
                }
            }
        }
    }
}
