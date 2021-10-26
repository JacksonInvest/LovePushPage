@extends('backEnd.layouts.base')
@section('title', 'Plan details')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">

			<h5 style="margin-bottom: 2em;">{{ $plan->name }} Plan</h5>

			<div class="row">
				<div style="text-align: right;">
					<a href="{{ url('admin/plan_edit', $plan->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
				</div>

				@if($plan->plan_id != '1')

				<div class="col-md-6">

					<div class="form-group row">
						<label for="network_marketing" class="col-md-12 col-xs-12 col-form-label"><strong>Paypal Basic Details</strong></label>
					</div>

					<div class="form-group row">
						<label for="status" class="col-md-2 col-xs-12 col-form-label">Status</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->state }}" readonly="">
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
							<input class="form-control" type="text" value="{{ $plan->paypal_details->name }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="description" class="col-md-2 col-xs-12 col-form-label">Description</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->description }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="type" class="col-md-2 col-xs-12 col-form-label">Plan Type</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->type }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="network_marketing" class="col-md-12 col-xs-12 col-form-label"><strong>Paypal Payment Definition</strong></label>
					</div>

					<div class="form-group row">
						<label for="name" class="col-md-2 col-xs-12 col-form-label">Name</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->name }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="type" class="col-md-2 col-xs-12 col-form-label">Type</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->type }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="frequency" class="col-md-2 col-xs-12 col-form-label">Frequency</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->frequency }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="amount" class="col-md-2 col-xs-12 col-form-label">Amount</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->amount->currency }} {{ $plan->paypal_details->payment_definitions[0]->amount->value }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="cycles" class="col-md-2 col-xs-12 col-form-label">Cycles</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->cycles }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="frequency_interval" class="col-md-2 col-xs-12 col-form-label">Frequency Interval</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->paypal_details->payment_definitions[0]->frequency_interval }}" readonly="">
						</div>
					</div>

				</div>

				@endif

				<div class="col-xs-6">

					<div class="form-group row">
						<label for="network_marketing" class="col-md-12 col-xs-12 col-form-label"><strong>Plan Features</strong></label>
					</div>

					<div class="form-group row">
						<label for="name" class="col-md-2 col-xs-12 col-form-label">Plan Name</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->name }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="price" class="col-md-2 col-xs-12 col-form-label">Price</label>
						<div class="col-xs-10">
							<input class="form-control" type="text" value="{{ $plan->price }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="messages" class="col-md-2 col-xs-12 col-form-label">Messages</label>
						<div class="col-xs-10">
							<?php
								if($plan['messages'] != 'Unlimited'){
					                $plan['messages'] = $plan['messages'].' daily';
					            }
							?>
							<input class="form-control" type="text" value="{{ $plan['messages'] }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="sending_requests" class="col-md-2 col-xs-12 col-form-label">Sending requests</label>
						<div class="col-xs-10">
							<?php
								if($plan['sending_requests'] != 'Unlimited'){
					                $plan['sending_requests'] = $plan['sending_requests'].' daily';
					            }
							?>
							<input class="form-control" type="text" value="{{ $plan['sending_requests'] }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="see_love_requests" class="col-md-2 col-xs-12 col-form-label">See love requests</label>
						<div class="col-xs-10">
							<?php
								if($plan['see_love_requests'] != 'Unlimited'){
					                $plan['see_love_requests'] = $plan['see_love_requests'].' daily';
					            }
					            else{
					                $plan['see_love_requests'] = 'See all';
					            }
							?>
							<input class="form-control" type="text" value="{{ $plan['see_love_requests'] }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="recommended_profiles" class="col-md-2 col-xs-12 col-form-label">Recommended profiles</label>
						<div class="col-xs-10">
							<?php
								if($plan['recommended_profiles'] != 'Unlimited'){
					                $plan['recommended_profiles'] = $plan['recommended_profiles'].' weekly';
					            }
					            else{
					                $plan['recommended_profiles'] = 'See all';
					            }
							?>
							<input class="form-control" type="text" value="{{ $plan['recommended_profiles'] }}" readonly="">
						</div>
					</div>

					<div class="form-group row">
						<label for="ads" class="col-md-2 col-xs-12 col-form-label">Ads</label>
						<div class="col-xs-10">
							<?php
								if($plan['ads'] != 'Unlimited'){
					                $plan['ads'] = $plan['ads'].' monthly';
					            }
							?>
							<input class="form-control" type="text" value="{{ $plan['ads'] }}" readonly="">
						</div>
					</div>
				</div>

			</div>

			<a href="{{ url('admin/plan_list') }}" class="btn btn-info"> << Back</a>
				
		</div>
    </div>
</div>

@endsection
