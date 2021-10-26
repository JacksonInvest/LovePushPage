@extends('backEnd.layouts.base')

@section('title', ': Cms Page')
@section('content')

<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/pages') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 class="mb-2em">Cms Page</h5>
			<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
            <form class="form-horizontal" action="{{ url('admin/page/'.$page->id) }}" method="POST" role="form">
            	<div class="form-group row">
					<label for="name" class="col-md-2 col-xs-12 col-form-label">Title</label>
					<label for="name" class="col-md-2 col-xs-12 col-form-label">{{ $page->title  }}</label>
				</div>
            	<div class="form-group row">
					<label for="content" class="col-md-2 col-xs-12 col-form-label">Content</label>
					<div class="col-xs-10">
						<textarea name="content" id="editor" length="6000" rows="40" required="">
						    {!! $page->content !!}
						</textarea>
					</div>
				</div>
				<div class="form-group row">
					<label  class="col-md-2 col-xs-12 col-form-label"></label>
					<div class="col-xs-10 ">
            			{{csrf_field()}}
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/pages')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection

@section('scripts')
<script>
    $(document).ready(function() {
    	CKEDITOR.replace( 'content' );
		// ClassicEditor
		//     .create( document.querySelector( '#editor' ) )
		//     .then( editor => {
		//         console.log( editor );
		//     } )
		//     .catch( error => {
		//         console.error( error );
		//     } );
	});
</script>

@endsection