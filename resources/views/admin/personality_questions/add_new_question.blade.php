@extends('admin.master')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Add New Personality Question
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
                            <form role="form" action="{{route('add-question')}}" method="post">
                            <input type="hidden" name="qid" value="{{@$data['id']}}">
                                @csrf
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Question</label>
                                    <input type="test" class="form-control" name="question" placeholder="Enter question" value="{{old('question') != '' ? old('question') : @$data['question'] }}">
                                    <span class="error-msg">{{ $errors->first('question') }}</span>
                                </div>
                            
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Option 1</label>
                                    <input type="test" class="form-control" name="option_1" placeholder="Enter option 1" value="{{old('option_1') != '' ? old('option_1') : @$data['options'][0]['option']}}">
                                    <span class="error-msg">{{ $errors->first('option_1') }}</span>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Option 2</label>
                                    <input type="test" class="form-control" name="option_2" placeholder="Enter option 2"  value="{{old('option_2') != '' ? old('option_2') : @$data['options'][1]['option']}}">
                                    <span class="error-msg">{{ $errors->first('option_2') }}</span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Option 3</label>
                                    <input type="test" class="form-control" name="option_3" placeholder="Enter option 3" value="{{old('option_3') != '' ? old('option_3') : @$data['options'][2]['option']}}">
                                    <span class="error-msg">{{ $errors->first('option_3') }}</span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Option 4</label>
                                    <input type="test" class="form-control" name="option_4" placeholder="Enter option 4" value="{{old('option_4') != '' ? old('option_4') : @$data['options'][3]['option']}}">
                                    <span class="error-msg">{{ $errors->first('option_4') }}</span>
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