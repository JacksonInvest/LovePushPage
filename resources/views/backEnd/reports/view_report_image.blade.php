@extends('backEnd.layouts.base')
@section('title', ' Reported Image')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/reported_images') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 style="margin-bottom: 2em;">Reported Image Details</h5>

			<label class="col-form-label">Reported By:  </label>   <strong>{{ @$report->user->name }} ({{ @$report->user->email }})</strong><br/>

			<label class="col-form-label">Image Uploaded By:  </label>   <strong>{{ @$report->reported_user->name }} ({{ @$report->reported_user->email }})</strong><br/>

			<label class="col-form-label">Image Type:  </label>   <strong>
				@if($report->type == "profile_image")
                    Profile Image
                @elseif($report->type == "post")
                    Post
                @elseif($report->type == "post_ad")
                    Post Ad
                @endif
			</strong><br/><br/>

			<?php
				if($report->type == "profile_image"){
					$profile_image = App\UserProfileImages::where('id',$report->image_id)->value('image');
				}
				elseif($report->type == "post"){
	                $profile_image = App\Post::where('id',$report->image_id)->value('image');
				}
	            elseif($report->type == "post_ad"){
	                $profile_image = App\PostAds::where('id',$report->image_id)->value('image');
	            }
            ?>

            <img src="{{ $profile_image }}" width="400px" height="auto">
            <br/><br/>
		

            <form class="form-horizontal" action="{{ url('admin/report_images/remove_image') }}" method="POST" role="form">
            	
            	{{csrf_field()}}
            	<input type="hidden" name="row_id" value="{{ $report->id }}">
            	<input type="hidden" name="image_id" value="{{ $report->image_id }}">
            	<input type="hidden" name="image_type" value="{{ $report->type }}">
            	
			
				<div class="form-group row">
					<div class="col-xs-10">
						<button type="submit" class="btn btn-primary">Remove Image</button>
						<a href="{{ url('admin/reported_images')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection