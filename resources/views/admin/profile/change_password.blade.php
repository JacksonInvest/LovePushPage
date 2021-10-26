@extends('admin.master')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Edit Profile
            <small>Control panel</small>
        </h1>
        <!-- <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Edit Profile</li>
        </ol> -->
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="col-sm-6">
                        @if ($message = Session::get('success'))
                        <div class="alert alert-success alert-block">
                            <button type="button" class="close" data-dismiss="alert">×</button> 
                            <strong>{{ $message }}</strong>
                        </div>
                        @endif
                        @if ($message = Session::get('error'))
                        <div class="alert alert-danger alert-block">
                            <button type="button" class="close" data-dismiss="alert">×</button> 
                            <strong>{{ $message }}</strong>
                        </div>
                        @endif
                            <form role="form" action="{{route('change-password')}}" method="post">
                                @csrf
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Old Password</label>
                                    <input type="password" class="form-control" name="old_password" placeholder="Enter old password">
                                    <span class="error-msg">{{ $errors->first('old_password') }}</span>
                                </div>
                            
                                <div class="form-group">
                                    <label for="exampleInputPassword1">New Password</label>
                                    <input type="password" class="form-control" name="new_password" placeholder="Enter new password">
                                    <span class="error-msg">{{ $errors->first('new_password') }}</span>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Confirm New Password</label>
                                    <input type="password" class="form-control" name="new_password_confirmation" placeholder="Enter confirm new password">
                                    <span class="error-msg">{{ $errors->first('new_password_confirmation') }}</span>
                                </div>
                                <!-- /.box-body -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                <!-- /.box -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
@endsection