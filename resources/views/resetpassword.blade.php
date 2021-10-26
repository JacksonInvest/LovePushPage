<!DOCTYPE html>
<html lang="en">
<head>
    <title>Love Push</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->  
    <link rel="icon" type="image/png" href="{!! url('app/images/icons/favicon.ico') !!}"/>
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{!! url('app/vendor/bootstrap/css/bootstrap.min.css') !!}">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{!! url('app/fonts/font-awesome-4.7.0/css/font-awesome.min.css') !!}">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{!! url('app/fonts/Linearicons-Free-v1.0.0/icon-font.min.css') !!}">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{!! url('app/vendor/animate/animate.css') !!}">
<!--===============================================================================================-->  
    
<!--===============================================================================================-->

<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{!! url('app/css/util.css') !!}">
    <link rel="stylesheet" type="text/css" href="{!! url('app/css/main.css') !!}">
<!--===============================================================================================-->
</head>
<body>
    
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100 p-t-50 p-b-30">
                <form class="login100-form validate-form" method="post" action="{!! url('resetpassword1') !!}">
                    @csrf
                    <div class="login100-form-avatar">
                        <img src="{!! url('app/images/logo.png') !!}" alt="logo">
                    </div>
                   
                    <input type="hidden" name="user_id" value="{!! $user['id'] !!}">
                    <div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
                        <input class="input100" type="password" name="new_password" placeholder="New Password">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock"></i>
                        </span>
                        @if ($errors->has('new_password'))
                            <div class="alert alert-danger">
                                {{ $errors->first('new_password') }}
                            </div>
                        @endif
                    </div>
                    <div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
                        <input class="input100" type="password" name="repeat_password" placeholder="Repeat Password">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock"></i>
                        </span>
                        @if ($errors->has('repeat_password'))
                            <div class="alert alert-danger">
                                {{ $errors->first('repeat_password') }}
                            </div>
                        @endif
                    </div>
                     @if (session('error'))
                        <div class="alert alert-danger">
                            {{ session('error') }}
                        </div>
                    @endif
                    <div class="container-login100-form-btn p-t-10">
                        <input type="submit" name="submit" value="Submit" class="login100-form-btn">
                    </div>

                    

                    
                </form>
            </div>
        </div>
    </div>
    
    

    
<!--===============================================================================================-->  
    <script src="{!! url('app/vendor/jquery/jquery-3.2.1.min.js') !!}"></script>
<!--===============================================================================================-->
    <script src="{!! url('app/vendor/bootstrap/js/popper.js') !!}"></script>
    <script src="{!! url('app/vendor/bootstrap/js/bootstrap.min.js') !!}"></script>
<!--===============================================================================================-->

<!--===============================================================================================-->
    <script src="{!! url('app/js/main.js') !!}"></script>

</body>
</html>