@extends('backEnd.layouts.base')
@section('title', 'Plan details')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">

			<h5 style="margin-bottom: 2em;">Edit {{ $plan->name }} Plan</h5>

			<div class="row">

				<form class="form-horizontal" action="{{ url('admin/plan_update') }}" method="POST" role="form">
					@csrf

					<input type="hidden" name="local_plan_id" value="{{ $plan->id }}">
					<input type="hidden" name="paypal_plan_id" value="{{ $plan->plan_id }}">

				@if($plan->plan_id != '1')

				<div class="col-md-6">

					<div class="form-group row">
						<label for="network_marketing" class="col-md-12 col-xs-12 col-form-label"><strong>Paypal Basic Details</strong></label>
					</div>

					<div class="form-group row">
						<label for="status" class="col-md-2 col-xs-12 col-form-label">Status</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_plan_status" type="text" value="{{ $plan->paypal_details->state }}" readonly>
						</div>
					</div>

		        	<div class="form-group row">
						<label for="plan_id" class="col-md-2 col-xs-12 col-form-label">Plan ID</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->plan_id }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="name" class="col-md-2 col-xs-12 col-form-label">Plan Name</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_plan_name" type="text" value="{{ $plan->paypal_details->name }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="description" class="col-md-2 col-xs-12 col-form-label">Description</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_plan_desc" type="text" value="{{ $plan->paypal_details->description }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="type" class="col-md-2 col-xs-12 col-form-label">Plan Type</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_plan_type" type="text" value="{{ $plan->paypal_details->type }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="network_marketing" class="col-md-12 col-xs-12 col-form-label"><strong>Paypal Payment Definition</strong></label>
					</div>

					<div class="form-group row">
						<label for="name" class="col-md-2 col-xs-12 col-form-label">Name</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_payment_def_name" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->name }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="type" class="col-md-2 col-xs-12 col-form-label">Type</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_payment_def_type" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->type }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="frequency" class="col-md-2 col-xs-12 col-form-label">Frequency</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_payment_def_frequency" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->frequency }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="currency" class="col-md-2 col-xs-12 col-form-label">Currency</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->amount->currency }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="amount" class="col-md-2 col-xs-12 col-form-label">Amount</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_payment_def_amount" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->amount->value }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="cycles" class="col-md-2 col-xs-12 col-form-label">Cycles</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_payment_def_cycles" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->cycles }}" readonly>
						</div>
					</div>

					<div class="form-group row">
						<label for="frequency_interval" class="col-md-2 col-xs-12 col-form-label">Frequency Interval</label>
						<div class="col-xs-10">
							<input class="form-control" name="paypal_payment_def_frequency_interval" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->frequency_interval }}" readonly>
						</div>
					</div>

				</div>

				@endif

				<div class="col-xs-6">

					<div class="form-group row">
						<label for="network_marketing" class="col-md-12 col-xs-12 col-form-label"><strong>Plan Features</strong></label>
					</div>

					<div class="form-group row">
						<label for="name" class="col-md-3 col-xs-12 col-form-label">Plan Name</label>
						<div class="col-xs-9">
							<input class="form-control" name="plan_name" type="text" value="{{ $plan->name }}" >
						</div>
					</div>

					<div class="form-group row">
						<label for="price" class="col-md-3 col-xs-12 col-form-label">Price</label>
						<div class="col-xs-9">
							<input class="form-control" name="plan_price" type="text" value="{{ $plan->price }}" >
						</div>
					</div>

					<div class="form-group row">
						<label for="messages" class="col-md-3 col-xs-12 col-form-label">Messages (Daily)</label>
						<div class="col-xs-6">
							<input class="form-control" name="messages" id="messages" type="text" value="{{ $plan['messages'] }}" <?php if($plan['messages'] == "Unlimited") echo "readonly"; ?>>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="messages_checkbox" id="messages_checkbox" <?php if($plan['messages'] == "Unlimited") echo "checked"; ?>> Unlimited
						</div>
					</div>

					<div class="form-group row">
						<label for="sending_requests" class="col-md-3 col-xs-12 col-form-label">Sending requests (Daily)</label>
						<div class="col-xs-6">
							<input class="form-control" name="sending_requests" id="sending_requests" type="text" value="{{ $plan['sending_requests'] }}" <?php if($plan['sending_requests'] == "Unlimited") echo "readonly"; ?>>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="sending_requests_checkbox" id="sending_requests_checkbox" <?php if($plan['sending_requests'] == "Unlimited") echo "checked"; ?>> Unlimited
						</div>
					</div>

					<div class="form-group row">
						<label for="see_love_requests" class="col-md-3 col-xs-12 col-form-label">See love requests (Daily)</label>
						<div class="col-xs-6">
							<input class="form-control" name="see_love_requests" id="see_love_requests" type="text" value="{{ $plan['see_love_requests'] }}" <?php if($plan['see_love_requests'] == "Unlimited") echo "readonly"; ?>>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="see_love_requests_checkbox" id="see_love_requests_checkbox" <?php if($plan['see_love_requests'] == "Unlimited") echo "checked"; ?>> Unlimited
						</div>
					</div>

					<div class="form-group row">
						<label for="recommended_profiles" class="col-md-3 col-xs-12 col-form-label">Recommended profiles (Weekly)</label>
						<div class="col-xs-6">
							<input class="form-control" name="recommended_profiles" id="recommended_profiles" type="text" value="{{ $plan['recommended_profiles'] }}" <?php if($plan['recommended_profiles'] == "Unlimited") echo "readonly"; ?>>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="recommended_profiles_checkbox" id="recommended_profiles_checkbox" <?php if($plan['recommended_profiles'] == "Unlimited") echo "checked"; ?>> Unlimited
						</div>
					</div>

					<div class="form-group row">
						<label for="ads" class="col-md-3 col-xs-12 col-form-label">Ads (Monthly)</label>
						<div class="col-xs-6">
							<input class="form-control" name="ads" id="ads" type="text" value="{{ $plan['ads'] }}" <?php if($plan['ads'] == "Unlimited") echo "readonly"; ?>>
						</div>
						<div class="col-xs-3">
							<input type="checkbox" name="ads_checkbox" id="ads_checkbox" <?php if($plan['ads'] == "Unlimited") echo "checked"; ?>> Unlimited
						</div>
					</div>
				</div>

				<div class="form-group row">
					<label for="network_marketing" class="col-md-3 col-xs-12 col-form-label"></label>
					<div class="col-xs-9">
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/plan_list') }}" class="btn btn-info"> Back</a>
					</div>
				</div>
			</form>

			</div>
				
		</div>
    </div>
</div>
<script type="text/javascript">
function validate1() {
    if (document.getElementById('ads_checkbox').checked) {
        document.getElementById('ads').value = "Unlimited";
        document.getElementById('ads').readOnly = true;
    } else {
        document.getElementById('ads').value = "";
        document.getElementById('ads').readOnly = false;
    }
}
function validate2() {
    if (document.getElementById('recommended_profiles_checkbox').checked) {
        document.getElementById('recommended_profiles').value = "Unlimited";
        document.getElementById('recommended_profiles').readOnly = true;
    } else {
        document.getElementById('recommended_profiles').value = "";
        document.getElementById('recommended_profiles').readOnly = false;
    }
}
function validate3() {
    if (document.getElementById('see_love_requests_checkbox').checked) {
        document.getElementById('see_love_requests').value = "Unlimited";
        document.getElementById('see_love_requests').readOnly = true;
    } else {
        document.getElementById('see_love_requests').value = "";
        document.getElementById('see_love_requests').readOnly = false;
    }
}
function validate4() {
    if (document.getElementById('sending_requests_checkbox').checked) {
        document.getElementById('sending_requests').value = "Unlimited";
        document.getElementById('sending_requests').readOnly = true;
    } else {
        document.getElementById('sending_requests').value = "";
        document.getElementById('sending_requests').readOnly = false;
    }
}
function validate5() {
    if (document.getElementById('messages_checkbox').checked) {
        document.getElementById('messages').value = "Unlimited";
        document.getElementById('messages').readOnly = true;
    } else {
        document.getElementById('messages').value = "";
        document.getElementById('messages').readOnly = false;
    }
}

document.getElementById('ads_checkbox').addEventListener('change', validate1);
document.getElementById('recommended_profiles_checkbox').addEventListener('change', validate2);
document.getElementById('see_love_requests_checkbox').addEventListener('change', validate3);
document.getElementById('sending_requests_checkbox').addEventListener('change', validate4);
document.getElementById('messages_checkbox').addEventListener('change', validate5);
</script>

@endsection
