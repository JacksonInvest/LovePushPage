@extends('backEnd.layouts.base')

<?php
		$form_title  = 'Add';
		$form_action = url('admin/postads/add');
?>
@section('title', $form_title.' PostAds')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/postads') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">{{ $form_title }} PostAds</h5>

            <form class="form-horizontal" action="{{ $form_action }}" method="POST" enctype="multipart/form-data" role="form">
            	
            	{{csrf_field()}}

            	<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Title</label>
						<input class="form-control" type="text" value="{{ old('title') }}" name="title" id="title" placeholder="title" maxlength="100">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="email" class="col-form-label">User Name</label>
						<select name="username" class="form-control">
							<option value="">Select User Name</option>
							@foreach($users as $user)
								<option value="{!! $user['id'] !!}" <?php if(old('username') == $user['id']) echo "selected"; ?> >{!! $user['username'] !!}</option>
							@endforeach
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="post_type" class="col-form-label">Post type</label>
						<select name="post_type" class="form-control">
							<option value="">Select Status</option>
							<option value="1" <?php if(old('post_type') == "1") echo "selected"; ?>>Love Ads</option>
							<option value="2" <?php if(old('post_type') == "2") echo "selected"; ?>>Connect Ads</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Description</label>
						<textarea class="form-control" name="description" maxlength="1000">{{ old('description')  }}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="picture" class="col-form-label ">Image <span class="note">(allowed formats: .jpg, jpeg, png)</span></label>
						<input type="file" name="image" class="dropify form-control-file" id="picture" tip="image" aria-describedby="fileHelp">
					</div>
				</div> 

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="location" class="col-form-label">Location</label>
						<input class="form-control" type="text" value="{{ old('location') }}" name="location" id="location" placeholder="location">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="radius" class="col-form-label">Radius</label>
						<input class="form-control" type="text" value="{{ old('radius') }}" name="radius" id="radius" placeholder="radius">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="is_post_anonymously" class="col-form-label">Is post anonymously</label>
						<select name="is_post_anonymously" class="form-control">
							<option value="">Select</option>
							<option value="1" <?php if(old('is_post_anonymously') == "1") echo "selected"; ?>>Show</option>
							<option value="2" <?php if(old('is_post_anonymously') == "2") echo "selected"; ?>>Profile hidden</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="status" class="col-form-label">Status</label>
						<select name="status" class="form-control">
							<option value="">Select Status</option>
							<option value="1" <?php if(old('status') == "1") echo "selected"; ?>>Active</option>
							<option value="0" <?php if(old('status') == "0") echo "selected"; ?>>Inactive</option>
						</select>
					</div>
				</div>
			
				<div class="form-group row">
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/postads')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection


@section('scripts')
<script>
	/*$('.timepicker1').timepicker({
		minuteStep : 1,
		defaultTime: '00:00',
		showMeridian: false //24 hr
	});*/

	/*image validation*/
    $(document).ready(function() {
        $(".dropify").change(function(){ 
        	var tip = $(this).attr('tip');

            var img_name = $(this).val();
            if(img_name != "" && img_name!=null) {
                var img_arr=img_name.split('.');
                var ext = img_arr.pop();
                ext     = ext.toLowerCase();
                
                if(tip == 'resume'){
                	if(ext =="doc" || ext =="docx" || ext =="pdf") {	
	                } else { 
	                    $(this).val('');
	                	$(this).siblings('.dropify-clear').click();
	                    alert('Only .doc,docx,pdf formats are allowed.');
	                }

                } else{
	                if(ext =="jpg" || ext =="jpeg" || ext =="png") {	
	                } else { 
	                    $(this).val('');
	                	$(this).siblings('.dropify-clear').click();
	                    alert('Only .jpg,jpeg,png formats are allowed.');
	                }
                }
            }
            return true;
        }); 
    });
</script>

 <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHOG6bM0xCdYihfeVmz2ItSaPtxar8NZg&libraries=places"></script>
 <script>
 	function initialize() {
          var input = document.getElementById('location');
          var autocomplete = new google.maps.places.Autocomplete(input);
            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();
                document.getElementById('location').value = place.name;
                //document.getElementById('cityLat').value = place.geometry.location.lat();
                //document.getElementById('cityLng').value = place.geometry.location.lng();
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
</script>
 
@endsection


@section('scripts')
<script>
	/*$('.timepicker1').timepicker({
		minuteStep : 1,
		defaultTime: '00:00',
		showMeridian: false //24 hr
	});*/

	/*image validation*/
    $(document).ready(function() {
        $(".dropify").change(function(){ 
        	var tip = $(this).attr('tip');

            var img_name = $(this).val();
            if(img_name != "" && img_name!=null) {
                var img_arr=img_name.split('.');
                var ext = img_arr.pop();
                ext     = ext.toLowerCase();
                
                if(tip == 'resume'){
                	if(ext =="doc" || ext =="docx" || ext =="pdf") {	
	                } else { 
	                    $(this).val('');
	                	$(this).siblings('.dropify-clear').click();
	                    alert('Only .doc,docx,pdf formats are allowed.');
	                }

                } else{
	                if(ext =="jpg" || ext =="jpeg" || ext =="png") {	
	                } else { 
	                    $(this).val('');
	                	$(this).siblings('.dropify-clear').click();
	                    alert('Only .jpg,jpeg,png formats are allowed.');
	                }
                }
            }
            return true;
        }); 
    });
</script>
@endsection