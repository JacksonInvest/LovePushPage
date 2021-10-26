@extends('backEnd.layouts.base')

<?php
	$form_title  = 'View';
	$form_action = url('admin/report/edit/'.$report->id);
?>
@section('title', $form_title.' User Report')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/reports') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">{{ $form_title }} User Report</h5>

            <form class="form-horizontal" action="{{ $form_action }}" method="POST" enctype="multipart/form-data" role="form">
            	
            	{{csrf_field()}}

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">From User Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('name'))) ? old('name') : @$report->user->name  }}" name="name" required id="name" placeholder="plan Name" maxlength="100" autocomplete="off" disabled="">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">To User Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('name'))) ? old('name') : @$report->fromUser->name  }}" name="name" required id="name" placeholder="plan Name" maxlength="100" autocomplete="off" disabled="">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Reason</label>
						<textarea class="form-control" disabled="">{{ (null !== (old('name'))) ? old('name') : @$report->reason  }}</textarea>
						<!-- <input  type="text" value="{{ (null !== (old('name'))) ? old('name') : @$report->reason  }}" name="reason" required  placeholder="Reason" maxlength="100" autocomplete="off"> -->
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Admin reply</label>
						<textarea class="form-control" required placeholder="Admin Reply" name="admin_reply">{{ (null !== (old('name'))) ? old('name') : @$report->admin_reply  }}</textarea>
						<!-- <input class="form-control" type="text" value="{{ (null !== (old('name'))) ? old('name') : @$report->admin_reply  }}" name="admin_reply" required  placeholder="Admin Reply" maxlength="100" autocomplete="off"> -->
					</div>
				</div>


				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="status" class="col-form-label">Status</label>
						<select name="status" class="form-control" required>
							<option value="0" <?php if($report->status == 0 ) { echo "selected";} ?>>Pending</option>
							<option value="1"
								@if(null !== old('status') )
									@if(old('status') == 1)
										selected
									@endif
								@elseif(@$report->status == 1)
									selected
								@endif
							>User Account Inactive</option>

							<option value="2"
								@if(null !== old('status') )
									@if(old('status') == 2)
										selected
									@endif
								@elseif(@$plan->status == 2)
									selected
								@endif
							>Reject user report</option>
						</select>
					</div>
				</div>
			
				<div class="form-group row">
					<div class="col-xs-10">
						<input type="hidden" name="to_user_id" value="{{ @$report->fromUser->id }}">
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/reports')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection
