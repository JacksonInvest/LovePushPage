@extends('backEnd.layouts.base')

<?php if(!isset($school)){
		$form_title  = 'Add';
		$form_action = url('admin/school/add');
	} else{
		$form_title  = 'Edit';
		$form_action = url('admin/school/edit/'.$school->id);
	}
?>
@section('title', $form_title.' School')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/schools') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">{{ $form_title }} School</h5>

            <form class="form-horizontal" action="{{ $form_action }}" method="POST" enctype="multipart/form-data" role="form">
            	
            	{{csrf_field()}}

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label"> Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('name'))) ? old('name') : @$school->name  }}" name="name" required id="name" placeholder="School Name" maxlength="100" autocomplete="off">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="status" class="col-form-label">Status</label>
						<select name="status" class="form-control" required>
							<option value="">Select Status</option>
							<option value="1"
								@if(null !== old('status') )
									@if(old('status') == '1')
										selected
									@endif
								@elseif(@$school->status == '1')
									selected
								@endif
							>Active</option>

							<option value="0"
								@if(null !== old('status') )
									@if(old('status') == '0')
										selected
									@endif
								@elseif(@$school->status == '0')
									selected
								@endif
							>Inactive</option>
						</select>
					</div>
				</div>
			
				<div class="form-group row">
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/schools')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection
