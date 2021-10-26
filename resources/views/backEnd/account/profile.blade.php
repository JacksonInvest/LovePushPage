@extends('backEnd.layouts.base')

@section('title', 'Admin Profile ')

@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">

			<h5 style="margin-bottom: 2em;">Account Settings</h5>

            <form class="form-horizontal" action="{{url('admin/profile/edit')}}" method="POST" enctype="multipart/form-data" role="form">
            	{{csrf_field()}}

				<div class="form-group row">
					<label for="name" class=" col-xs-2 col-form-label"></label>
					<label for="name" class=" col-xs-2 col-form-label"><b>Personal Settings</b></label>
				</div>
				<div class="form-group row">
					<label for="name" class="col-xs-2 col-form-label">Name</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="{{ Auth::guard('admin')->user()->name }}" name="name" required id="name" placeholder=" Name" maxlength="255">
					</div>
				</div>

				<!-- <fieldset class="form-group row">
					<legend class="col-form-legend col-sm-2">Gender</legend>
					<div class="col-sm-10">
						<div class="form-check">
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="gender" value="male" 
									@if(Auth::guard('admin')->user()->gender == 'male') 
										checked 
									@endif>
								Male
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="gender" value="female" 
									@if(Auth::guard('admin')->user()->gender == 'female')
										checked 
									@endif>
								Female
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="gender" value="others" 
									@if(Auth::guard('admin')->user()->gender == 'others') 
										checked 
									@endif>
								Others
							</label>
						</div>
					</div>
				</fieldset> -->

				<div class="form-group row">
					<label for="email" class="col-xs-2 col-form-label">Email</label>
					<div class="col-xs-10">
						<input class="form-control" type="email" required name="email" value="{{ isset(Auth::guard('admin')->user()->email) ? Auth::guard('admin')->user()->email : '' }}" id="email" placeholder="Email" maxlength="255">
					</div>
				</div>

				<div class="form-group row">
					<label for="picture" class="col-xs-2 col-form-label">Picture</label>
					<div class="col-xs-10">
						<a href="{{ Auth::guard('admin')->user()->image }}" data-fancybox >
							<img class="img-thumb" src="{{ Auth::guard('admin')->user()->image }}" alt="user image"> 
						</a>
						<input type="file" accept="image/*" name="image" class=" dropify form-control-file" aria-describedby="fileHelp">
					</div>
				</div>

				<div class="form-group row">
					<label for="phone" class="col-xs-2 col-form-label">Phone</label>
					<div class="col-xs-10">
						<input class="form-control" type="number" value="{{ isset(Auth::guard('admin')->user()->phone) ? Auth::guard('admin')->user()->phone : '' }}" name="phone" required id="phone" placeholder="Mobile" maxlength="255">
					</div>
				</div>
				<!-- <div class="form-group row">
					<label for="name" class=" col-xs-2 col-form-label"></label>
					<label for="name" class=" col-xs-2 col-form-label"><b>System Settings</b></label>
				</div>
				<div class="form-group row">
					<label for="capture_distance" class="col-xs-2 col-form-label">Capture Distance (In Meters)</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" required name="capture_distance" value="{{ isset(Auth::guard('admin')->user()->capture_distance) ? Auth::guard('admin')->user()->capture_distance : '' }}" id="capture_distance" placeholder="Capture Distance " maxlength="255">
					</div>
				</div> -->

				<div class="form-group row">
					<label for="" class="col-xs-2 col-form-label"></label>
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Update Profile</button>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>

@endsection