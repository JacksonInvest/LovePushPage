<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>{{ PROJECT_NAME }} @yield('title')</title>
    <link rel="shortcut icon" type="image/png" href="{{ asset(SYS_IMG_PATH).'/logo-foot.jpg' }}"/>
    <!-- Vendor CSS -->
    <link rel="stylesheet" href="{{asset('/backEnd/vendor/bootstrap4/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('/backEnd/vendor/themify-icons/themify-icons.css')}}">
    <link rel="stylesheet" href="{{asset('/backEnd/vendor/font-awesome/css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="{{asset('/backEnd/assets/css/core.css')}}">
    <link rel="stylesheet" href="{{asset('/backEnd/assets/css/developer.css')}}">
</head>
<body>

    <?php $background = asset('/svg/503.svg'); ?>
    <body class="img-cover" style="background-image: url({{$background}});">
        <div class="container-fluid">
            @yield('content')
        </div>
        <!-- Vendor JS -->
        <script type="text/javascript" src="{{asset('/backEnd/vendor/jquery/jquery-1.12.3.min.js')}}"></script>
        <script type="text/javascript" src="{{asset('/backEnd/vendor/tether/js/tether.min.js')}}"></script>
        <script type="text/javascript" src="{{asset('/backEnd/vendor/bootstrap4/js/bootstrap.min.js')}}"></script>
    </body>
</html>
