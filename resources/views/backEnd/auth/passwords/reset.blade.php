@extends('backEnd.layouts.auth')

@section('content')
<div class="sign-form reset-pass-form">
    <div class="row">
        <div class="col-md-4 offset-md-4 px-3">
            <div class="box b-a-0">
                <div class="p-2 text-xs-center">
                    <h5>Reset Password</h5>
                </div>
                <form class="form-material mb-1" role="form" method="POST" action="{{ url('/admin/reset-password') }}" >
                    <!-- include('backEnd.common.notify') -->
                    
                    <div class="px-2 form-group mb-0">
                        <p class="text-center" >Enter verification code you received on your email address.</p>
                    </div>

                    <div class="form-group {{ $errors->has('verify_code') ? ' has-error' : '' }}">
                        <input type="text" name="verify_code" value="{{ old('verify_code') }}" autofocus required="true" class="form-control" id="verify_code" placeholder="Verification Code">
                        @if ($errors->has('verify_code'))
                            <span class="help-block">
                                <strong>{{ $errors->first('verify_code') }}</strong>
                            </span>
                        @endif
                    </div>

                    <div class="form-group {{ $errors->has('password') ? ' has-error' : '' }}">
                        <input type="password" name="password" required="true" class="form-control" id="password" placeholder="Password">
                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>

                    <div class="form-group {{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                        <input type="password" name="password_confirmation" required="true" class="form-control" id="password_confirmation" placeholder="Confirm Password">
                        @if ($errors->has('password_confirmation'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password_confirmation') }}</strong>
                            </span>
                        @endif
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
                        {{ csrf_field() }}
                        <input type="hidden" name="email" value="{{ $email }}">
                        <button type="submit" class="btn btn-purple btn-block text-uppercase">Reset Password</button>
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
