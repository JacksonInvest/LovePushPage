<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>{{ PROJECT_NAME }}: @yield('title')</title>
    <link rel="shortcut icon" type="image/png" href="{{ asset(SYS_IMG_PATH).'/logo.png' }}"/>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Chango" rel="stylesheet">

    <!-- Custom stlylesheet -->
    <link rel="stylesheet" href="{{asset('public/backEnd/assets/css/error.css')}}" type="text/css" >

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body>

    <div id="notfound">
        <div class="notfound">
            @yield('content')            
        </div>
    </div>

</body>
</html>