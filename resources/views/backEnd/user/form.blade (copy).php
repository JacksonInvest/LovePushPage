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
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">First Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('first_name'))) ? old('first_name') : @$user->first_name  }}" name="first_name" required id="first_name" placeholder="First Name" maxlength="100">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8">
						<label for="last_name" class="col-form-label">Last Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('last_name'))) ? old('last_name') : @$user->last_name  }}" name="last_name" required id="last_name" placeholder="Last Name" maxlength="100">
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="last_name_access" value="0" 
								<?php if( ((old('last_name_access')) == 0) || (@$user->last_name_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('last_name_access')) == "") || (@$user->last_name_access  == "" ) ){
									echo 'checked';
								} ?>
								> Public</label>
							<label ><input type="radio" name="last_name_access" value="1"
								@if( ((old('last_name_access')) == 1) || (@$user->last_name_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="email" class="col-form-label">Email</label>
						<input class="form-control" type="text" value="{{ (null !== (old('email'))) ? old('email') : @$user->email  }}" name="email" readonly="" id="email" placeholder="Email" maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="email_access" value="0"
								<?php if( ((old('email_access')) == 0) || (@$user->email_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('email_access')) == "") || (@$user->email_access  == "" ) ){
									echo 'checked';
								} ?>
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
					<div class="col-md-8">
						<label for="phone" class="col-form-label">Phone</label>
						<input class="form-control" type="text" value="{{ (null !== (old('phone'))) ? old('phone') : @$user->phone  }}" name="phone" id="phone" placeholder="Phone" maxlength="50">
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="phone_access" value="0"
								<?php if( ((old('phone_access')) == 0) || (@$user->phone_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('phone_access')) == "") || (@$user->phone_access  == "" ) ){
									echo 'checked';
								} ?>
								> Public</label>
							<label ><input type="radio" name="phone_access" value="1"
								@if( ((old('phone_access')) == 1) || (@$user->phone_access  == 1) )
									checked
								@endif

								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-4 ">
						<label for="email" class="col-form-label">State (Currently lives in)</label>
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
						<label for="city_id" class="col-form-label">City (Currently lives in)</label>
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
						<label for="city_id_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="city_id_access" value="0"
								<?php if( ((old('city_id_access')) == 0) || (@$user->city_id_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('city_id_access')) == "") || (@$user->city_id_access  == "" ) ){
									echo 'checked';
								} ?>
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
					<div class="col-md-4 ">
						<label for="from_state_id" class="col-form-label">State (From)</label>
						<select name="from_state_id" class="form-control" required>
							<option value="">Select State</option>
							@foreach($states as $state)
								<option value="{{ $state['id'] }}" 
									
									@if(null !== old('from_state_id') )
										@if(old('from_state_id') == $state['id'])
											selected
										@endif
									@elseif(@$user->from_state_id == $state['id'])
										selected
									@endif
								>{{ ucfirst($state['name']) }}</option>
							@endforeach
						</select>
					</div>
					<div class="col-md-4">
						<label for="from_city_id" class="col-form-label">City (From)</label>
						<select name="from_city_id" class="form-control" required>
							<option value="">Select City</option>
							@foreach($from_cities as $city)
								<option value="{{ $city['id'] }}" 
									
									@if(null !== old('from_city_id') )
										@if(old('from_city_id') == $city['id'])
											selected
										@endif
									@elseif(@$user->from_city_id == $city['id'])
										selected
									@endif

								>{{ ucfirst($city['name']) }}</option>
							@endforeach
						</select>					
					</div>
					<div class="col-md-2 access-div">
						<label for="from_city_id_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="from_city_id_access" value="0"
								<?php if( ((old('from_city_id_access')) == 0) || (@$user->from_city_id_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('from_city_id_access')) == "") || (@$user->from_city_id_access  == "" ) ){
									echo 'checked';
								} ?>
								> Public</label>
							<label ><input type="radio" name="from_city_id_access" value="1"
								@if( ((old('from_city_id_access')) == 1) || (@$user->from_city_id_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="occupation" class="col-form-label">Occupation</label>
						<input class="form-control" type="text" value="{{ (null !== (old('occupation'))) ? old('occupation') : @$user->occupation  }}" name="occupation" required id="occupation" placeholder="Occupation"  maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="occupation_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="occupation_access" value="0" 
								<?php if( ((old('occupation_access')) == 0) || (@$user->occupation_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('occupation_access')) == "") || (@$user->occupation_access  == "" ) ){
									echo 'checked';
								} ?>
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
						<input class="form-control" type="text" value="{{ (null !== (old('work_website'))) ? old('work_website') : @$user->work_website  }}" name="work_website" required id="work_website" placeholder="Work Website"  maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="work_website_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="work_website_access" value="0" 
								<?php if( ((old('work_website_access')) == 0) || (@$user->work_website_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('work_website_access')) == "") || (@$user->work_website_access  == "" ) ){
									echo 'checked';
								} ?>
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
						<input class="form-control" type="text" value="{{ (null !== (old('education'))) ? old('education') : @$user->education  }}" name="education" required id="education" placeholder="Education"  maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="education" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="education_access" value="0" 
								<?php if( ((old('education_access')) == 0) || (@$user->education_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('education_access')) == "") || (@$user->education_access  == "" ) ){
									echo 'checked';
								} ?>
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
						<label for="high_school" class="col-form-label">High School</label>
						<input class="form-control" type="text" value="{{ (null !== (old('high_school'))) ? old('high_school') : @$user->high_school  }}" name="high_school" required id="high_school" placeholder="High School"  maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="high_school" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="high_school_access" value="0" 
								<?php if( ((old('high_school_access')) == 0) || (@$user->high_school_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('high_school_access')) == "") || (@$user->high_school_access  == "" ) ){
									echo 'checked';
								} ?>
								> Public</label>
							<label ><input type="radio" name="high_school_access" value="1"
								@if( ((old('high_school_access')) == 1) || (@$user->high_school_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="college" class="col-form-label">College</label>
						<input class="form-control" type="text" value="{{ (null !== (old('college'))) ? old('college') : @$user->college  }}" name="college" required id="college" placeholder="College" maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="college" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="college_access" value="0" 
								<?php if( ((old('college_access')) == 0) || (@$user->college_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('college_access')) == "") || (@$user->college_access  == "" ) ){
									echo 'checked';
								} ?>
								> Public</label>
							<label ><input type="radio" name="college_access" value="1"
								@if( ((old('college_access')) == 1) || (@$user->college_access  == 1) )
									checked
								@endif
								> Private</label>
						</div>
					</div>
				</div>	

				<div class="form-group row">
					<div class="col-md-8 col-md-offset-1">
						<label for="alma_matter" class="col-form-label">Alma Matter</label>
						<input class="form-control" type="text" value="{{ (null !== (old('alma_matter'))) ? old('alma_matter') : @$user->alma_matter  }}" name="alma_matter" required id="alma_matter" placeholder="Alma Matter" maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="first_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="alma_matter_access" value="0" 
								<?php if( ((old('alma_matter_access')) == 0) || (@$user->alma_matter_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('alma_matter_access')) == "") || (@$user->alma_matter_access  == "" ) ){
									echo 'checked';
								} ?>

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
						<input class="form-control" type="text" value="{{ (null !== (old('likes'))) ? old('likes') : @$user->likes  }}" name="likes" required id="likes" placeholder="Likes, Hobbies,Interests" maxlength="255">
					</div>
					<div class="col-md-2 access-div">
						<label for="likes_name" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="likes_access" value="0" 
								<?php if( ((old('likes_access')) == 0) || (@$user->likes_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('likes_access')) == "") || (@$user->likes_access  == "" ) ){
									echo 'checked';
								} ?>
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
								<?php if( ((old('military_id_access')) == 0) || (@$user->military_id_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('military_id_access')) == "") || (@$user->military_id_access  == "" ) ){
									echo 'checked';
								} ?>
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
								<?php if( ((old('political_id_access')) == 0) || (@$user->political_id_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('political_id_access')) == "") || (@$user->political_id_access  == "" ) ){
									echo 'checked';
								} ?>
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
								<?php if( ((old('religion_id_access')) == 0) || (@$user->religion_id_access  == 0) ) { 
									echo 'checked';
								} else if( ((old('religion_id_access')) == "") || (@$user->religion_id_access  == "" ) ){
									echo 'checked';
								} ?>

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
								<?php if( ((old('relationship_id_access')) == 0) || (@$user->relationship_id_access  == 0) ) { 
									echo 'checked';
								}else if( ((old('relationship_id_access')) == "") || (@$user->relationship_id_access  == "" ) ){
									echo 'checked';
								} ?>
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
						<label for="fb_link" class="col-form-label">Facebook link</label>
						<input name="fb_link" class="form-control  input-small" type="text" value="{{ (null !== (old('fb_link'))) ? old('fb_link') : @$user->fb_link  }}"   placeholder="Facebook link" maxlength="255" >
					</div>
					<div class="col-md-2 access-div">
						<label for="fb_link_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="fb_link_access" value="0" 
								@if( ((old('fb_link_access')) == 0) || (@$user->fb_link_access  == 0) )
									checked
								@endif
							> Public</label>
							<label ><input type="radio" name="fb_link_access" value="1"
								@if( ((old('fb_link_access')) == 1) || (@$user->fb_link_access  == 1) )
									checked
								@endif
							> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8">
						<label for="insta_link" class="col-form-label">Instagram link</label>
						<input name="insta_link" class="form-control  input-small" type="text" value="{{ (null !== (old('insta_link'))) ? old('insta_link') : @$user->insta_link  }}"  placeholder="Instagram link" maxlength="255" >
					</div>
					<div class="col-md-2 access-div">
						<label for="insta_link_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="insta_link_access" value="0" 
								@if( ((old('insta_link_access')) == 0) || (@$user->insta_link_access  == 0) )
									checked
								@endif
							> Public</label>
							<label ><input type="radio" name="insta_link_access" value="1"
								@if( ((old('insta_link_access')) == 1) || (@$user->insta_link_access  == 1) )
									checked
								@endif
							> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8">
						<label for="twit_link" class="col-form-label">Twitter link</label>
						<input name="twit_link" class="form-control  input-small" type="text" value="{{ (null !== (old('twit_link'))) ? old('twit_link') : @$user->twit_link  }}"   placeholder="Twitter link" id="time" maxlength="255" >
					</div>
					<div class="col-md-2 access-div">
						<label for="twit_link_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="twit_link_access" value="0" 
								@if( ((old('twit_link_access')) == 0) || (@$user->twit_link_access  == 0) )
									checked
								@endif
							> Public</label>
							<label ><input type="radio" name="twit_link_access" value="1"
								@if( ((old('twit_link_access')) == 1) || (@$user->twit_link_access  == 1) )
									checked
								@endif
							> Private</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8">
						<label for="linked_in_link" class="col-form-label">Linked-in link</label>
						<input name="linked_in_link" class="form-control  input-small" type="text" value="{{ (null !== (old('linked_in_link'))) ? old('linked_in_link') : @$user->linked_in_link  }}"   placeholder="Linked-in link" id="time" maxlength="255" >
					</div>
					<div class="col-md-2 access-div">
						<label for="linked_in_link_access" class="col-form-label">Access</label>
						<div class="radio">
							<label><input type="radio" name="linked_in_link_access" value="0"
								@if( ((old('linked_in_link_access')) == 0) || (@$user->linked_in_link_access  == 0) )
									checked
								@endif
							> Public</label>
							<label ><input type="radio" name="linked_in_link_access" value="1"
								@if( ((old('linked_in_link_access')) == 1) || (@$user->linked_in_link_access  == 1) )
									checked
								@endif
							> Private</label>
						</div>
					</div>
				</div>

				<?php /*
				<div class="form-group row">
					<div class="col-md-8">
						<label for="capture_distance" class="col-form-label">Capture Distance
							<span class="note">(Distance range for other members profiles capture)</span>
						</label>
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
				*/ ?>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="capture_time_period" class="col-form-label">Capture Time period In Minutes
							<span class="note">(Time for how long a profile needs to be in range, to appear in captured suggestions)</span>
						</label>

						<input name="capture_time_period" class="form-control  input-small" type="text" value="{{ (null !== (old('capture_time_period'))) ? old('capture_time_period') : @$user->capture_time_period  }}"  required placeholder="Capture Time period" id="time" maxlength="3" >
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
						<label for="password" class="col-form-label">Password  
							@if($form_title == 'Edit')
							<span class="note">(Fill only if you want to change password)</span>
							@endif
						</label>
						<input class="form-control" type="password" value="{{ (null !== (old('password'))) ? old('password') : ""  }}" name="password" id="password" placeholder="Password">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-8">
						<label for="password_confirmation" class="col-form-label">Password Confirmation</label>
						<input class="form-control" type="password" value="{{ (null !== (old('password_confirmation'))) ? old('password_confirmation') : @$user->password_confirmation  }}" name="password_confirmation" id="password_confirmation" placeholder="Re-type Password">
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
						<label for="picture" class="col-form-label ">Resume <span class="note">(allowed formats: doc, docx, pdf)</span></label>
						<div class="col-md-12 ">
							@if(@$user->resume)
							<div class="usr-img resume">
								<!-- <a href="{{ @$user->resume }}" target="_blank"><button type="button" class="btn btn-primary ">View Resume</button></a> -->
								<div class="del-btn" >
									<a href="{{ url('admin/user/resume/delete/'.$user->id) }}"  onclick="return confirm('Are you sure?')" ><i class="fa fa-trash"></i></a>
								</div>
								<a href="{{ @$user->resume }}" target="_blank" style="text-decoration: underline; margin-bottom: 10px; margin-left: 20px;" >View Resume</a>
							</div>
							@endif
						</div>
						<input type="file" name="resume" class="dropify form-control-file" id="picture" tip="resume" aria-describedby="fileHelp">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<!-- <div class="col-md-12 row" > -->
						<label for="picture" class="col-form-label ">Main Image <span class="note">(allowed formats: .jpg, jpeg, png)</span></label>
						@if(@$user->image['thumb'])
							<div class="col-md-12 ">
								<div class="usr-img">
									<a href="{{ $user->image['thumb'] }}" target="_blank">
										<img class="img-thumb" src="{{ $user->image['thumb'] }}" alt="">
									</a>
									<div class="del-btn" >
										<a href="{{ url('admin/user/main-image/delete/'.$user->id) }}"  onclick="return confirm('Are you sure?')" ><i class="fa fa-trash"></i></a>
									</div>
								</div>
							</div>
						@endif
						<input type="file" name="image" class="dropify form-control-file" id="picture" tip="image" aria-describedby="fileHelp">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<!-- <div class="col-md-12 row" > -->
						<label for="picture" class="col-form-label ">Pictures <span class="note">(allowed formats: .jpg,jpeg,png. Add upto three profile pictures)</span></label>
						<div class="col-md-12 ">
							<?php $img_count = 0; ?>
							@if(isset($user->images))
								@foreach($user->images as $user_image)
									@if(!empty($user_image->name['org']))
									<div class="usr-img">
										<a href="{{ $user_image->name['org'] }}" target="_blank">
											<img class="img-thumb" src="{{ $user_image->name['org'] }}" alt="">
										</a>

										<div class="del-btn" >
											<a href="{{ url('admin/user/image/delete/'.$user_image->id) }}"  onclick="return confirm('Are you sure?')" ><i class="fa fa-trash"></i></a>
										</div>
									</div>
									<?php $img_count++; ?>
									@endif
								@endforeach
							@endif
						</div>
						@if($img_count < MAX_USER_IMG_COUNT)
						<input type="file" accept="image/*" name="multi_images[]" class="dropify form-control-file" id="picture" tip="multi_img" aria-describedby="fileHelp">
						@endif
					</div>
				</div>

				@if($img_count < MAX_USER_IMG_COUNT)
					<div class="more-img"></div>
					<!-- <div class="form-group row ">
						<div class="col-md-10 col-xs-12">
							<button type="button" class="btn btn-primary add-img-div-btn">Add More Pictures</button>
						</div>
					</div> -->
				@endif
				<input type="hidden" class="img_count" value="{{ ++$img_count }}">
				
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

<script type="text/javascript"> 
	$(document).ready(function(){

		/*$('select[name=country_id]').on('change',function(){
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
		})*/

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

		$('select[name=from_state_id]').on('change',function(){
			var state_id = $(this).val();
			if(state_id == ""){
				$('select[name=from_city_id]').html('<option value="">Select City</option>');
			} else{
				$('.preloader').show();
				$.ajax({
					url:"{{ url('location/get-cities') }}"+'/'+state_id,
					method:'get',
					success:function(options){
						$('select[name=from_city_id]').html(options);
						$('.preloader').hide();						
					}
				})
			}
		})

		//add more image functionality
		var img_count_inp = $('.img_count');
		var max_img_count = {{ MAX_USER_IMG_COUNT }};

		$('.add-img-div-btn').click(function(){
			var avl_img_count =  parseInt(img_count_inp.val(),10);
			if(avl_img_count < max_img_count){
				var html = `<div class="form-group row ">
						<div class="col-xs-8">
							<input type="file" accept="image/*" name="image[]" class="dropify form-control-file" id="picture" aria-describedby="fileHelp" multiple="">
						</div>
					</div>`;
				$('.more-img').append(html);
				$('.more-img .dropify').dropify();
				img_count_inp.val(avl_img_count+1);
			} else{
				alert('Maximum '+max_img_count+' images can be added');
			}
		})
	})
</script> 
@endsection