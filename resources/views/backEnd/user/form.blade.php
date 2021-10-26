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
						<label for="first_name" class="col-form-label">Name</label>
						<input class="form-control" type="text" value="{{ (null !== (old('name'))) ? old('name') : @$user->name  }}" name="name" id="name" placeholder="Name" maxlength="100">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="username" class="col-form-label">Username</label>
						<input class="form-control" type="text" value="{{ (null !== (old('username'))) ? old('username') : @$user->username  }}" name="username" id="username" placeholder="Username" maxlength="100">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<?php if(isset($user->email)) { 
							$readOnly = 'readonly'; 
						} else {
							$readOnly = '';
						} ?>
						<label for="email" class="col-form-label">Email Address</label>
						<input class="form-control" type="text" value="{{ (null !== (old('email'))) ? old('email') : @$user->email  }}" name="email" id="email" placeholder="Email" maxlength="255" {{ $readOnly }}>
					</div>
				</div>

				{{--<div class="form-group row">
					<div class="col-md-8 ">
						<label for="phone_code" class="col-form-label">Phone Code</label>
						
						<select name="phone_code" class="form-control">
							<option value="">Select Code</option>
							<option value="+1"
								@if(null !== old('phone_code') )
									@if(old('phone_code') == '+1')
										selected
									@endif
								@elseif(@$user->phone_code == '+1')
									selected
								@endif
							>United States (+1)</option>

							<option value="+91"
								@if(null !== old('phone_code') )
									@if(old('status') == '+91')
										selected
									@endif
								@elseif(@$user->phone_code == '+91')
									selected
								@endif
							>India (+91)</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Phone no.</label>
						<input class="form-control" type="text" value="{{ (null !== (old('phone'))) ? old('phone') : @$user->phone  }}" name="phone" placeholder="Phone number" maxlength="20">
					</div>
				</div>--}}

            	<div class="form-group row">
					<div class="col-md-8 ">
						<label for="status" class="col-form-label">Gender</label>
						<select name="gender" class="form-control">
							<option value="">Select Gender</option>
							<option value="1"
								@if(null !== old('gender') )
									@if(old('gender') == '1')
										selected
									@endif
								@elseif(@$user->gender == '1')
									selected
								@endif
							>Male</option>

							<option value="2"
								@if(null !== old('gender') )
									@if(old('status') == '2')
										selected
									@endif
								@elseif(@$user->gender == '2')
									selected
								@endif
							>Female</option>
							<option value="3"
								@if(null !== old('gender') )
									@if(old('status') == '3')
										selected
									@endif
								@elseif(@$user->gender == '3')
									selected
								@endif
							>Other</option>
						</select>
					</div>
				</div>

				<!-- <div class="form-group row">
					<div class="col-md-8 ">
						<label for="picture" class="col-form-label ">Image <span class="note">(allowed formats: .jpg, jpeg, png)</span></label>
						@if(@$user->profile_image != '')
							<div class="col-md-12 ">
								<div class="usr-img">
									<?php
										$img = '';
										if(@$user->profile_image != '') {
											$img = $user->profile_image;
										}
									?>
									<a href="{{ $img }}" data-fancybox  >
										<img class="img-thumb" src="{{ $img }}" alt="">
									</a>
								</div>
							</div>
						@endif
						<input type="file" name="image" class="dropify form-control-file" id="picture" tip="image" aria-describedby="fileHelp">
					</div>
				</div> -->
				
				<div class="form-group row">
					<div class="col-md-8">
						<label for="password" class="col-form-label">Password  
							@if($form_title == 'Edit')
							<span class="note">(Fill only if you want to change password)</span>
							@endif
						</label>
						<input class="form-control" type="password" value="{{ (null !== (old('password'))) ? old('password') : ""  }}" name="password" id="password" placeholder="Password" minlength="5" maxlength="10">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Hobbies</label>
						<textarea class="form-control" placeholder="Hobbies" maxlength="1000" name="hobbies">{{ (null !== (old('hobbies'))) ? old('hobbies') : @$user->hobbies  }}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">About</label>
						<textarea class="form-control" placeholder="About me" maxlength="1000" name="aboutme">{{ (null !== (old('aboutme'))) ? old('aboutme') : @$user->aboutme  }}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="love_push_intention" class="col-form-label">Love Push Intenison</label>
						<br>
						<input type="checkbox" name="love_push_intention[]" value="Relationship" <?php if (strpos(@$user->love_push_intention, 'Relationship') !== false) echo "checked"; ?>> Relationship<br>
						<input type="checkbox" name="love_push_intention[]" value="Friendship" <?php if (strpos(@$user->love_push_intention, 'Friendship') !== false) echo "checked"; ?>> Friendship<br>
						<input type="checkbox" name="love_push_intention[]" value="Daily Activities" <?php if (strpos(@$user->love_push_intention, 'Daily Activities') !== false) echo "checked"; ?>> Daily Activities<br>
						<input type="checkbox" name="love_push_intention[]" value="No Expectation" <?php if (strpos(@$user->love_push_intention, 'No Expectation') !== false)  echo "checked" ; ?>> No Expectation<br>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="age" class="col-form-label">Age</label>
						<select name="age" class="form-control">
							<option value="">Select Age</option>
							<?php for($i=18; $i<=98; $i++){ ?>
								<option value="<?= $i; ?>" <?php if(@$user->age == $i) echo "selected"; ?>><?= $i; ?></option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="status" class="col-form-label">Sexual Orientation</label>
						<select name="sexual_orientation" class="form-control">
							<option value="1"
								@if(null !== old('sexual_orientation') )
									@if(old('sexual_orientation') == '1')
										selected
									@endif
								@elseif(@$user->sexual_orientation == '1')
									selected
								@endif
							>Hetrosexual</option>

							<option value="2"
								@if(null !== old('sexual_orientation') )
									@if(old('sexual_orientation') == '2')
										selected
									@endif
								@elseif(@$user->sexual_orientation == '2')
									selected
								@endif
							>Bisexual</option>

							<option value="3"
								@if(null !== old('sexual_orientation') )
									@if(old('sexual_orientation') == '3')
										selected
									@endif
								@elseif(@$user->sexual_orientation == '3')
									selected
								@endif
							>Homesexual</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="partner_preference" class="col-form-label">Partner preference</label>
						<select name="partner_preference" class="form-control">
							<option value="">Select Status</option>
							<option value="1"
								@if(null !== old('partner_preference') )
									@if(old('partner_preference') == '1')
										selected
									@endif
								@elseif(@$user->partner_preference == '1')
									selected
								@endif
							>Male</option>

							<option value="2"
								@if(null !== old('partner_preference') )
									@if(old('partner_preference') == '2')
										selected
									@endif
								@elseif(@$user->partner_preference == '2')
									selected
								@endif
							>Female</option>

							<option value="3"
								@if(null !== old('partner_preference') )
									@if(old('partner_preference') == '3')
										selected
									@endif
								@elseif(@$user->partner_preference == '3')
									selected
								@endif
							>Anyone</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Relationship</label>
						{{--<input class="form-control" type="text" value="{{ (null !== (old('relationship'))) ? old('relationship') : @$user->relationship  }}" name="relationship" placeholder="Relationship" maxlength="20">--}}
						<select name="relationship" class="form-control">
							<option value="">Select Status</option>
							<option value="1"
								@if(null !== old('relationship') )
									@if(old('relationship') == '1')
										selected
									@endif
								@elseif(@$user->relationship == '1')
									selected
								@endif
							>Single</option>

							<option value="2"
								@if(null !== old('relationship') )
									@if(old('relationship') == '2')
										selected
									@endif
								@elseif(@$user->relationship == '2')
									selected
								@endif
							>In relationship</option>

							<option value="3"
								@if(null !== old('relationship') )
									@if(old('relationship') == '3')
										selected
									@endif
								@elseif(@$user->relationship == '3')
									selected
								@endif
							>married</option>

							<option value="4"
								@if(null !== old('relationship') )
									@if(old('relationship') == '4')
										selected
									@endif
								@elseif(@$user->relationship == '4')
									selected
								@endif
							>Recently separated</option>

							<option value="5"
								@if(null !== old('relationship') )
									@if(old('relationship') == '5')
										selected
									@endif
								@elseif(@$user->relationship == '5')
									selected
								@endif
							>Open relationship</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="language" class="col-form-label">Languages</label>
						<input class="form-control" type="text" value="{{ (null !== (old('language'))) ? old('language') : @$user->language  }}" name="language" placeholder="Languages">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="size" class="col-form-label">Size</label>
						<input class="form-control" type="text" value="{{ (null !== (old('size'))) ? old('size') : @$user->size  }}" name="size" placeholder="Size">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="physique" class="col-form-label">Physique</label>
						<select name="physique" class="form-control">
							<option value="">Select Physique</option>
							<option value="1"
								@if(null !== old('physique') )
									@if(old('physique') == '1')
										selected
									@endif
								@elseif(@$user->physique == '1')
									selected
								@endif
							>Plump</option>

							<option value="2"
								@if(null !== old('physique') )
									@if(old('physique') == '2')
										selected
									@endif
								@elseif(@$user->physique == '2')
									selected
								@endif
							>Thin</option>

							<option value="3"
								@if(null !== old('physique') )
									@if(old('physique') == '3')
										selected
									@endif
								@elseif(@$user->physique == '3')
									selected
								@endif
							>Athletic</option>

							<option value="4"
								@if(null !== old('physique') )
									@if(old('physique') == '4')
										selected
									@endif
								@elseif(@$user->physique == '4')
									selected
								@endif
							>Muscular</option>

							<option value="5"
								@if(null !== old('physique') )
									@if(old('physique') == '5')
										selected
									@endif
								@elseif(@$user->physique == '5')
									selected
								@endif
							>Normal</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="job" class="col-form-label">Job & Employer</label>
						<input class="form-control" type="text" value="{{ (null !== (old('job'))) ? old('job') : @$user->job  }}" name="job" placeholder="Job & Employer">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="education" class="col-form-label">Favorite Travel Destinations</label>
						<input class="form-control" type="text" value="{{ (null !== (old('education'))) ? old('education') : @$user->education  }}" name="education" placeholder="Favorite Travel Destinations">
					</div>
				</div>

				{{--<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Eye color</label>
						<input class="form-control" type="text" value="{{ (null !== (old('eyecolor'))) ? old('eyecolor') : @$user->eyecolor  }}" name="eyecolor" placeholder="Eye color" maxlength="20">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Hair color</label>
						<input class="form-control" type="text" value="{{ (null !== (old('haircolor'))) ? old('haircolor') : @$user->haircolor  }}" name="haircolor" placeholder="Hair color" maxlength="20">
					</div>
				</div>--}}

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="status" class="col-form-label">Status</label>
						<select name="status" class="form-control">
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
					<div class="col-xs-10">
						<input type="hidden" name="type" value="{{ $type }}">
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
 
@endsection