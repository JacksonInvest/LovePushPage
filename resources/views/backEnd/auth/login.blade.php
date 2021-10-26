@extends('backEnd.layouts.auth')

@section('content')
<div class="sign-form">
    <div class="row">
        <div class="col-md-4 offset-md-4 px-3">
            <div class="box b-a-0">
                <div class="p-2 text-xs-center">
                    <h5>Admin Login</h5>
                </div>
                <form class="form-material mb-1" role="form" method="POST" action="{{ url('/admin/login') }}" id="login-form" >
                {{ csrf_field() }}
                    <div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                        <input type="email" name="email" required="true" class="form-control" id="email" placeholder="Email">
                        @if ($errors->has('email'))
                            <span class="help-block" style="margin-left: 55px;color: red;">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                    <div class="form-group {{ $errors->has('password') ? ' has-error' : '' }}">
                        <input type="password" name="password" required="true" class="form-control" id="password" placeholder="Password">

                    </div>

                    @if(Session::has('error'))
                        <div class="px-2 form-group has-error">
                            <span class="help-block">
                                <strong>{{ Session::get('error') }}</strong>
                            </span>
                        </div>
                    @endif
                    @if(Session::has('success'))
                        <div class="px-2 form-group has-success">
                            <span class="help-block">
                                <strong>{{ Session::get('success') }}</strong>
                            </span>
                        </div>
                    @endif

                    <div class="px-2 form-group mb-0">
                        <div class="checkbox">
                          <label><input type="checkbox" value="remember" name="remember">Remember Me</label>
                        </div>
                    </div>
                    <br>
                    <div class="px-2 form-group mb-0">
                        <button type="submit" class="btn btn-purple btn-block text-uppercase">Sign in</button>
                    </div>
                </form>
                <div class="p-2 text-xs-center text-muted">
                    <a class="text-black" href="{{ url('admin/forgot-password') }}"><span class="underline">Forgot Your Password?</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
