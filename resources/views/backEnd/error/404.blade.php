@extends('backEnd.layouts.error')
@section('title', 'Not Found')

@section('content')
	<div>
		<div class="notfound-404">
			<h1>!</h1>
		</div>
		<h2>Error<br>404</h2>
	</div>
	<p>The page you are looking for might have been removed had its name changed or is temporarily unavailable. <a href="{{ url('admin') }}">Back to homepage</a></p>
@endsection