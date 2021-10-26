@extends('backEnd.layouts.base')

@section('title', 'Dashboard ')

@section('styles')
	<link rel="stylesheet" href="{{asset('backEnd/vendor/jvectormap/jquery-jvectormap-2.0.3.css')}}">
@endsection

@section('content')

<div class="content-area py-1">
	<div class="container-fluid">
	    <div class="row row-md">
			<div class="col-lg-3 col-md-6 col-xs-12">
				<a href="{{ url('admin/users') }}">
					<div class="box box-block bg-white tile tile-1 mb-2">
						<div class="t-icon right"><span class="bg-success"></span><i class="fa fa-users"></i></div>
						<div class="t-content">
							<h6 class="text-uppercase mb-1">User's</h6>
							<h1 class="mb-1">{{ $user_count }}</h1>
							<!-- <i class="fa fa-caret-up text-success mr-0-5"></i><span>1</span> -->
						</div>
					</div>
				</a>
			</div>
			<!-- <div class="col-lg-3 col-md-6 col-xs-12">
				<a href="{{ url('admin/schools') }}">
					<div class="box box-block bg-white tile tile-1 mb-2">
						<div class="t-icon right"><span class="bg-success"></span><i class="fa fa-university"></i></div>
						<div class="t-content">
							<h6 class="text-uppercase mb-1">School's</h6>
							<h1 class="mb-1">56</h1>
						</div>
					</div>
				</a>
			</div>  -->
		</div>

	</div>
</div>
@endsection

@section('scripts')
	<script type="text/javascript" src="{{asset('backEnd/vendor/jvectormap/jquery-jvectormap-2.0.3.min.js')}}"></script>
	<script type="text/javascript" src="{{asset('backEnd/vendor/jvectormap/jquery-jvectormap-world-mill.js')}}"></script>

	<script type="text/javascript">
		$(document).ready(function(){

		        /* Vector Map 
		    $('#world').vectorMap({
		        zoomOnScroll: false,
		        map: 'world_mill',
		        markers: [
		        foreach(@$rides as @$ride)
		        	@if(@$ride->status != "CANCELLED")
		            {latLng: [{{@$ride->s_latitude}}, {{@$ride->s_longitude}}], name: '{{@$ride->user->first_name}}'},
		            @endif
		        endforeach

		        ],
		        normalizeFunction: 'polynomial',
		        backgroundColor: 'transparent',
		        regionsSelectable: true,
		        markersSelectable: true,
		        regionStyle: {
		            initial: {
		                fill: 'rgba(0,0,0,0.15)'
		            },
		            hover: {
		                fill: 'rgba(0,0,0,0.15)',
		            stroke: '#fff'
		            },
		        },
		        markerStyle: {
		            initial: {
		                fill: '#43b968',
		                stroke: '#fff'
		            },
		            hover: {
		                fill: '#3e70c9',
		                stroke: '#fff'
		            }
		        },
		        series: {
		            markers: [{
		                attribute: 'fill',
		                scale: ['#43b968','#a567e2', '#f44236'],
		                values: [200, 300, 600, 1000, 150, 250, 450, 500, 800, 900, 750, 650]
		            },{
		                attribute: 'r',
		                scale: [5, 15],
		                values: [200, 300, 600, 1000, 150, 250, 450, 500, 800, 900, 750, 650]
		            }]
		        }
		    }); */
		});
	</script>

@endsection