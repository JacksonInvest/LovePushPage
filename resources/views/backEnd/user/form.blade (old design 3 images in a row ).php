@extends('backEnd.layouts.base')

<?php if(!isset($user)){
		$form_title  = 'Add';
		$form_action = url('admin/user/add');
	} else{
		$form_title  = 'Edit';
		$form_action = url('admin/user/edit/'.$user->id);
	}
?>
@section('title', $form_title.' User')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/users') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">{{ $form_title }} User</h5>

            <form class="form-horizontal" action="{{ $form_action }}" method="POST" enctype="multipart/form-data" role="form">
            	
            	{{csrf_field()}}
				<div class="form-group row">
					<div class="col-md-4 ">
						<label for="first_name" class="col-form-label">First Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('first_name'))) ? old('first_name') : @$user->first_name  }}" name="first_name" required id="first_name" placeholder="First Name">
					</div>
					<div class="col-md-4">
						<label for="last_name" class="col-form-label">Last Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('last_name'))) ? old('last_name') : @$user->last_name  }}" name="last_name" required id="last_name" placeholder="Last Name">
					</div>
			
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="name_access" value="0" 
								@if( ((old('name_access')) == 0) || (@$user->name_access  == 0) )
									checked
								@else if( ((old('name_access')) == "") || (@$user->name_access  == "" ) )
									checked
								@endif

								> Public</label>
							<label ><input type="radio" name="name_access" value="1"
								@if( ((old('name_access')) == 1) || (@$user->name_access  == 1) )
									checked
								@endif

								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="email" class="col-form-label">Email</label>
						<input class="form-control" type="text" value="{{ (null !== (old('email'))) ? old('email') : @$user->email  }}" name="email" required id="email" placeholder="Email">
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="email_access" value="0"
								@if( ((old('email_access')) == 0) || (@$user->email_access  == 0) )
									checked
								@else if( ((old('email_access')) == "") || (@$user->email_access  == "") )
									checked
								@endif
								
								> Public</label>
							<label ><input type="radio" name="email_access" value="1"
								@if( ((old('email_access')) == 1) || (@$user->email_access  == 1) )
									checked
								@endif

								> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-4 ">
						<label for="email" class="col-form-label">State</label>
						<select name="state_id" class="form-control" required>
							<option value="">Select State</option>
							@foreach($states as $state)
								<option value="{{ $state['id'] }}" 
									
									@if(null !== old('state_id') )
										@if(old('state_id') == $state['id'])
											selected
										@endif
									@elseif(@$user->state_id == $state['id'])
										selected
									@endif
								>{{ ucfirst($state['name']) }}</option>
							@endforeach
						</select>
					</div>
					<div class="col-md-4">
						<label for="city_id" class="col-form-label">City</label>
						<select name="city_id" class="form-control" required>
							<option value="">Select City</option>
							@foreach($cities as $city)
								<option value="{{ $city['id'] }}" 
									
									@if(null !== old('city_id') )
										@if(old('city_id') == $city['id'])
											selected
										@endif
									@elseif(@$user->city_id == $city['id'])
										selected
									@endif
								>{{ ucfirst($city['name']) }}</option>
							@endforeach
						</select>					
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="city_id_access" value="0"
								@if( ((old('city_id_access')) == 0) || (@$user->city_id_access  == 0) )
									checked
								@else if( ((old('city_id_access')) == "") || (@$user->city_id_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="city_id_access" value="1"
								@if( ((old('city_id_access')) == 1) || (@$user->city_id_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="occupation" class="col-form-label">Occupation</label>
						<input class="form-control" type="text" value="{{ (null !== (old('occupation'))) ? old('occupation') : @$user->occupation  }}" name="occupation" required id="occupation" placeholder="Occupation">
					</div>
					<div class="col-md-2 access-div">
						<label for="occupation" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="occupation_access" value="0" 
								@if( ((old('occupation_access')) == 0) || (@$user->occupation_access  == 0) )
									checked
								@else if( ((old('occupation_access')) == "") || (@$user->occupation_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="occupation_access" value="1"
								@if( ((old('occupation_access')) == 1) || (@$user->occupation_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="work_website" class="col-form-label">Work Website</label>
						<input class="form-control" type="text" value="{{ (null !== (old('work_website'))) ? old('work_website') : @$user->work_website  }}" name="work_website" required id="work_website" placeholder="Work Website">
					</div>
					<div class="col-md-2 access-div">
						<label for="work_website" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="work_website_access" value="0" 
								@if( ((old('work_website_access')) == 0) || (@$user->work_website_access  == 0) )
									checked
								@else if( ((old('work_website_access')) == "") || (@$user->work_website_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="work_website_access" value="1"
								@if( ((old('work_website_access')) == 1) || (@$user->work_website_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="education" class="col-form-label">Education</label>
						<input class="form-control" type="text" value="{{ (null !== (old('education'))) ? old('education') : @$user->education  }}" name="education" required id="education" placeholder="Education">
					</div>
					<div class="col-md-2 access-div">
						<label for="education" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="education_access" value="0" 
								@if( ((old('education_access')) == 0) || (@$user->education_access  == 0) )
									checked
								@else if( ((old('education_access')) == "") || (@$user->education_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="education_access" value="1"
								@if( ((old('education_access')) == 1) || (@$user->education_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>	

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="alma_matter" class="col-form-label">Alma Matter</label>
						<input class="form-control" type="text" value="{{ (null !== (old('alma_matter'))) ? old('alma_matter') : @$user->alma_matter  }}" name="alma_matter" required id="alma_matter" placeholder="Alma Matter">
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="alma_matter_access" value="0" 
								@if( ((old('alma_matter_access')) == 0) || (@$user->alma_matter_access  == 0) )
									checked
								@else if( ((old('alma_matter_access')) == "") || (@$user->alma_matter_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="alma_matter_access" value="1"
								@if( ((old('alma_matter_access')) == 1) || (@$user->alma_matter_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="likes" class="col-form-label">Likes, Hobbies,Interests</label>
						<input class="form-control" type="text" value="{{ (null !== (old('likes'))) ? old('likes') : @$user->likes  }}" name="likes" required id="likes" placeholder="Likes, Hobbies,Interests">
					</div>
					<div class="col-md-2 access-div">
						<label for="likes_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="likes_access" value="0" 
								@if( ((old('likes_access')) == 0) || (@$user->likes_access  == 0) )
									checked
								@else if( ((old('likes_access')) == "") || (@$user->likes_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="likes_access" value="1"
								@if( ((old('likes_access')) == 1) || (@$user->likes_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="military_id" class="col-form-label">Military</label>
						<select name="military_id" class="form-control" required>
							<option value="">Select military</option>
							@foreach($militaries as $military)
								<option value="{{ $military['id'] }}" 
									
									@if(null !== old('military_id') )
										@if(old('military_id') == $military['id'])
											selected
										@endif
									@elseif(@$user->military_id == $military['id'])
										selected
									@endif
								>{{ ucfirst($military['name']) }}</option>
							@endforeach
						</select>
					</div>
				
					<div class="col-md-2 access-div">
						<label for="military_id" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="military_id_access" value="0" 
								@if( ((old('military_id_access')) == 0) || (@$user->military_id_access  == 0) )
									checked
								@else if( ((old('military_id_access')) == "") || (@$user->military_id_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="military_id_access" value="1"
								@if( ((old('military_id_access')) == 1) || (@$user->military_id_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="political_id" class="col-form-label">Political Affiliation</label>
						<select name="political_id" class="form-control" required>
							<option value="">Select Political Affiliation</option>
							@foreach($politicals as $political)
								<option value="{{ $political['id'] }}" 
									
									@if(null !== old('political_id') )
										@if(old('political_id') == $political['id'])
											selected
										@endif
									@elseif(@$user->political_id == $political['id'])
										selected
									@endif
								>{{ ucfirst($political['name']) }}</option>
							@endforeach
						</select>
					</div>
				
					<div class="col-md-2 access-div">
						<label for="political" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="political_id_access" value="0" 
								@if( ((old('political_id_access')) == 0) || (@$user->political_id_access  == 0) )
									checked
								@else if( ((old('political_id_access')) == "") || (@$user->political_id_access  == "") )
									checked
								@endif 
								> Public</label>
							<label ><input type="radio" name="political_id_access" value="1"
								@if( ((old('political_id_access')) == 1) || (@$user->political_id_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="religion_id" class="col-form-label">Religion</label>
						<select name="religion_id" class="form-control" required>
							<option value="">Select religion</option>
							@foreach($religions as $religion)
								<option value="{{ $religion['id'] }}" 
									
									@if(null !== old('religion_id') )
										@if(old('religion_id') == $religion['id'])
											selected
										@endif
									@elseif(@$user->religion_id == $religion['id'])
										selected
									@endif
								>{{ ucfirst($religion['name']) }}</option>
							@endforeach
						</select>
					</div>
				
					<div class="col-md-2 access-div">
						<label for="religion_id" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="religion_id_access" value="0"  
								@if( ((old('religion_id_access')) == 0) || (@$user->religion_id_access  == 0) )
									checked
								@else if( ((old('religion_id_access')) == "") || (@$user->religion_id_access  == "") )
									checked
								@endif 
								> Public</label>
							<label ><input type="radio" name="religion_id_access" value="1"
								@if( ((old('religion_id_access')) == 1) || (@$user->religion_id_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="email" class="col-form-label">Relationship</label>
						<select name="relationship_id" class="form-control" required>
							<option value="">Select Relationship</option>
							@foreach($relationships as $relationship)
								<option value="{{ $relationship['id'] }}" 
									
									@if(null !== old('relationship_id') )
										@if(old('relationship_id') == $relationship['id'])
											selected
										@endif
									@elseif(@$user->relationship_id == $relationship['id'])
										selected
									@endif
								>{{ ucfirst($relationship['name']) }}</option>
							@endforeach
						</select>
					</div>
					<div class="col-md-2 access-div">
						<label for="relationship" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="relationship_id_access" value="0"  
								@if( ((old('relationship_id_access')) == 0) || (@$user->relationship_id_access  == 0) )
									checked
								@else if( ((old('relationship_id_access')) == "") || (@$user->relationship_id_access  == "") )
									checked
								@endif
								> Public</label>
							<label ><input type="radio" name="relationship_id_access" value="1"
								@if( ((old('relationship_id_access')) == 1) || (@$user->relationship_id_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="capture_distance" class="col-form-label">Capture Distance</label>
						<input class="form-control" type="text" value="{{ (null !== (old('capture_distance'))) ? old('capture_distance') : @$user->capture_distance  }}" name="capture_distance" required id="capture_distance" placeholder="Capture Distance">
					</div>
					<!-- <div class="col-md-2 access-div">
						<label for="capture_distance" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="capture_distance_access" value="0" checked> Public</label>
							<label ><input type="radio" name="capture_distance_access" value="1"> Private</label>
						</div>
					</div> -->
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="password" class="col-form-label">Password</label>
						<input class="form-control" type="text" value="{{ (null !== (old('password'))) ? old('password') : ""  }}" name="password" id="password" placeholder="Password">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8">
						<label for="password_confirmation" class="col-form-label">Password Confirmation</label>
						<input class="form-control" type="text" value="{{ (null !== (old('password_confirmation'))) ? old('password_confirmation') : @$user->password_confirmation  }}" name="password_confirmation" id="password_confirmation" placeholder="Re-type Password">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="status" class="col-form-label">Status</label>
						<select name="status" class="form-control" required>
							<option value="">Select Status</option>
							<option value="1"
								@if(null !== old('status') )
									@if(old('status') == '1')
										selected
									@endif
								@elseif(@$user->status == '1')
									selected
								@endif
							>Active</option>

							<option value="0"
								@if(null !== old('status') )
									@if(old('status') == '0')
										selected
									@endif
								@elseif(@$user->status == '0')
									selected
								@endif
							>Inactive</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<!-- <div class="col-md-12 row" > -->
							<label for="picture" class="col-md-12 col-form-label">Pictures</label>
							@if(isset($user->images))
								@foreach($user->images as $user_image)
									@if(!empty($user_image->name))
									<div style="position: relative;  margin-right: 10px; border:1x red solid; float: left;">
										<a href="{{ url(USER_PROFILE_BASE_PATH.$user_image->name) }}" target="_blank">
											<img class="img-thumb" src="{{ asset(USER_PROFILE_BASE_PATH.$user_image->name) }}" alt="">
										</a>

										<div style="position: absolute;  top:2px;"" >
											<a href="{{ url('admin/user/image/delete/'.$user_image->id) }}" style="color:red;" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" style="font-size: 18px;"></i></a>
										</div>
									</div>
									@endif
								@endforeach
							@endif
							
							<input type="file" accept="image/*" name="image[]" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">

							<!-- <label for="picture" class="col-form-label">Picture</label>
							<?php $img = (!empty(@$user->image)) ? $user->image : 'default_user.png'; ?>
							<img class="img-thumb" src="{{ asset(USER_PROFILE_BASE_PATH.$img) }}" alt="user image">  -->
						<!-- </div> -->
						<!-- <div class="col-md-4 " style="padding-left: 0px; padding-right: 0px; margin-right: 0px;">
							<input type="file" accept="image/*" name="image" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
						</div>
						<div class="col-md-4 ">
							<input type="file" accept="image/*" name="image" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
						</div>
						<div class="col-md-4 ">
							<input type="file" accept="image/*" name="image" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
						</div> -->
					</div>
				</div>

				<!-- <div class="form-group row">
					<div class="col-md-8 " >
						<div class="col-md-4 " style="margin: 0; padding: 0;">
							<input type="file" accept="image/*" name="image[]" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
						</div>
						<div class="col-md-4 ">
							<input type="file" accept="image/*" name="image[]" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
						</div>
						<div class="col-md-4 ">
							<input type="file" accept="image/*" name="image[]" class="dropify form-control-file" id="picture" aria-describedby="fileHelp">
						</div>
					</div>
				</div> -->

				<div class="form-group row">
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/users')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection


@section('scripts')
<script type="text/javascript"> 
	$(document).ready(function(){

		$('select[name=country_id]').on('change',function(){
			var country_id = $(this).val();
			if(country_id == ""){
				$('select[name=state_id]').html('<option value="">Select State</option>');
			} else{
				$('.preloader').show();
	 			$.ajax({
					url:"{{ url('location/get-states') }}"+'/'+country_id,
					method:'get',
					success:function(options){
						$('select[name=state_id]').html(options);
						$('.preloader').hide();
					}
				})
			}
			$('select[name=city_id]').html('<option value="">Select City</option>');
		})

		$('select[name=state_id]').on('change',function(){
			var state_id = $(this).val();
			if(state_id == ""){
				$('select[name=city_id]').html('<option value="">Select City</option>');
			} else{
				$('.preloader').show();
				$.ajax({
					url:"{{ url('location/get-cities') }}"+'/'+state_id,
					method:'get',
					success:function(options){
						$('select[name=city_id]').html(options);
						$('.preloader').hide();						
					}
				})
			}
		})

		$('.add-img-div-btn').click(function(){
			var html = `<div class="form-group row ">
					<label for="picture" class="col-md-2 col-xs-12 col-form-label">Picture</label>
					<div class="col-xs-10">
						<input type="file" accept="image/*" name="image[]" class="dropify form-control-file" id="picture" aria-describedby="fileHelp" multiple="">
					</div>
				</div>`;
			$('.more-img').append(html);
			$('.more-img .dropify').dropify();
		})

	})
</script> 
@endsection