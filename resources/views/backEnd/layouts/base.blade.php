<html lang="en">
	<head>
		<!-- Meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Title -->
		<title>{{ PROJECT_NAME }}: @yield('title')</title>

		<link rel="shortcut icon" type="image/png" href="{{ asset(SYS_IMG_PATH).'/logo-foot.jpg' }}"/>

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="{{asset('backEnd/vendor/bootstrap4/css/bootstrap.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/themify-icons/themify-icons.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/font-awesome/css/font-awesome.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/animate.css/animate.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/jscrollpane/jquery.jscrollpane.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/waves/waves.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/switchery/dist/switchery.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/DataTables/css/dataTables.bootstrap4.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/DataTables/Responsive/css/responsive.bootstrap4.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/DataTables/Buttons/css/buttons.dataTables.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/DataTables/Buttons/css/buttons.bootstrap4.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/vendor/switchery/dist/switchery.min.css')}}">
		<!-- <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">

		<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/> -->
		<link rel="stylesheet" href="{{asset('backEnd/vendor/dropify/dist/css/dropify.min.css')}}">

		<link rel="stylesheet" href="{{asset('backEnd/vendor/bootstrap-timepicker/bootstrap-timepicker.min.css')}}">

		<link rel="stylesheet" href="{{asset('backEnd/assets/css/jquery.fancybox.min.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/assets/css/core.css')}}">
		<link rel="stylesheet" href="{{asset('backEnd/assets/css/developer.css')}}">

		<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<!-- <style type="text/css">
			.rating-outer span,.rating-symbol-background{
			  color: #ffe000!important;
			}
			.rating-outer span,.rating-symbol-foreground{
			  color: #ffe000!important;
			}
			
		</style> -->
		@yield('styles')
	</head>
	<body class="fixed-sidebar fixed-header content-appear skin-default">
		<div class="wrapper">
			<!-- Preloader -->
			<div class="preloader"></div>

			<!-- Sidebar -->
			<div class="site-overlay"></div>
			@include('backEnd.common.nav')			

			@include('backEnd.common.header')

			<div class="site-content">
				@include('backEnd.common.notify')
				@yield('content')
				@include('backEnd.common.footer')
			</div>
		</div>
		<!-- Vendor JS -->
		<script type="text/javascript" src="{{asset('backEnd/vendor/jquery/jquery-1.12.3.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/tether/js/tether.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/bootstrap4/js/bootstrap.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/detectmobilebrowser/detectmobilebrowser.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/jscrollpane/jquery.mousewheel.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/jscrollpane/mwheelIntent.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/jscrollpane/jquery.jscrollpane.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/jquery-fullscreen-plugin/jquery.fullscreen')}}-min.js"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/waves/waves.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/js/jquery.dataTables.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/js/dataTables.bootstrap4.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Responsive/js/dataTables.responsi')}}ve.min.js"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Responsive/js/responsive.bootstra')}}p4.min.js"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Buttons/js/dataTables.buttons')}}.min.js"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Buttons/js/buttons.bootstrap4')}}.min.js"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/JSZip/jszip.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/pdfmake/build/pdfmake.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/pdfmake/build/vfs_fonts.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Buttons/js/buttons.html5.min.js')}}"></script>

		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Buttons/js/buttons.print.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/DataTables/Buttons/js/buttons.colVis.min.js')}}"></script>

		<script type="text/javascript" src="{{asset('backEnd/vendor/switchery/dist/switchery.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/dropify/dist/js/dropify.min.js')}}"></script>

		<!-- Neptune JS -->
		<script type="text/javascript" src="{{asset('backEnd/assets/js/app.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/assets/js/demo.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/assets/js/tables-datatable.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/assets/js/forms-upload.js')}}"></script>

		<script type="text/javascript" src="{{asset('backEnd/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/vendor/bootstrap-timepicker/bootstrap-timepicker.min.js')}}"></script>

		<script type="text/javascript" src="{{asset('backEnd/assets/js/jquery.fancybox.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('backEnd/assets/js/developer.js')}}"></script>
		
		@yield('scripts')

		<!-- to make side bar active even in the edit page -->
		<!-- <script type="text/javascript">
			$('.with-sub').click(function(){ 
				$(this).siblings().find('ul').removeClass('d-blk');
			});
		</script> -->

		<!-- <script type="text/javascript" src="{{asset('asset/js/rating.js')}}"></script>    
		<script type="text/javascript">
			$('.rating').rating();
		</script> -->
	</body>
</html>