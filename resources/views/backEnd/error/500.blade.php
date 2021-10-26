@extends('backEnd.layouts.error')
@section('title', 'Something went wrong')

@section('content')
	<div>
		<div class="notfound-404">
			<h1>!</h1>
		</div>
		<h2>Error<br>500</h2>
	</div>
	<p>Something went wrong. Please try again later. <a href="{{ url('admin') }}">Back to homepage</a></p>
@endsection