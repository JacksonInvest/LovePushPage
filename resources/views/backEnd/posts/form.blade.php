@extends('backEnd.layouts.base')

<?php if(!isset($posts)){
		$form_title  = 'Add';
		$form_action = url('admin/posts/add');
	} else{
		$form_title  = 'Edit';
		$form_action = url('admin/posts/edit/'.$posts->id);
	}
?>
@section('title', $form_title.' Posts')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/posts') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">{{ $form_title }} Posts</h5>

            <form class="form-horizontal" action="{{ $form_action }}" method="POST" enctype="multipart/form-data" role="form">
            	
            	{{csrf_field()}}

            	<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Title</label>
						<input class="form-control" type="text" value="{{ (null !== (old('title'))) ? old('title') : @$posts->title  }}" name="title" id="title" placeholder="title" maxlength="100">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8">
						<label for="email" class="col-form-label">User Name</label>
						<input class="form-control" type="text" value="{{ @$posts->userInfo->username  }}" placeholder="User name" maxlength="255" disabled>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="first_name" class="col-form-label">Description</label>
						<textarea class="form-control" name="description" rows="5" maxlength="1000">{{ (null !== (old('description'))) ? old('description') : @$posts->description  }}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="picture" class="col-form-label ">Image <span class="note">(allowed formats: .jpg, jpeg, png)</span></label>
						@if(@$posts->image != '')
							<div class="col-md-12 ">
								<div class="usr-img">
									<?php
										$img = '';
										if(@$posts->image != '') {
											$img = $posts->image;
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
				</div> 

				<div class="form-group row">
					<div class="col-md-8 ">
						<label for="is_post_anonymously" class="col-form-label">Is post anonymously</label>
						<select name="is_post_anonymously" class="form-control">
							<option value="">Select</option>
							<option value="1"
								@if(null !== old('is_post_anonymously') )
									@if(old('is_post_anonymously') == '1')
										selected
									@endif
								@elseif(@$posts->is_post_anonymously == '1')
									selected
								@endif
							>Show</option>

							<option value="2"
								@if(null !== old('is_post_anonymously') )
									@if(old('is_post_anonymously') == '2')
										selected
									@endif
								@elseif(@$posts->is_post_anonymously == '2')
									selected
								@endif
							>Profile hidden</option>
						</select>
					</div>
				</div>
				
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
								@elseif(@$posts->status == '1')
									selected
								@endif
							>Active</option>

							<option value="0"
								@if(null !== old('status') )
									@if(old('status') == '0')
										selected
									@endif
								@elseif(@$posts->status == '0')
									selected
								@endif
							>Inactive</option>
						</select>
					</div>
				</div>
			
				<div class="form-group row">
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/posts')}}" class="btn btn-default">Cancel</a>
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