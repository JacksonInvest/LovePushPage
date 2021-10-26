@extends('admin.master')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Personality Questions List
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
                <div class="box">
                    <div class="box-body">
                        <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                            <div class="row">
                                <div class="col-sm-6"></div>
                                <div class="col-sm-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
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
                                    <div id="succ-status-msg" class="alert alert-success alert-block" role="alert" style="display: none;">
                                        <button type="button" class="close" data-dismiss="alert">×</button> 
                                    </div>
                                    <div id="err-status-msg" class="alert alert-danger alert-block" role="alert" style="display: none;">
                                        <button type="button" class="close" data-dismiss="alert">×</button> 
                                    </div>
                                    <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                        <thead>
                                            <tr role="row">
                                                <th>Question</th>
                                                <th>Option</th>
                                                <th>Active</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            @if($questions->count())
                                                @foreach($questions as $k => $v)
                                                <tr role="row" class="odd">
                                                    <td>{{$v['question']}}</td>
                                                    <td>
                                                        <table class="table">
                                                            <tbody>
                                                                @if($v['options']->count())
                                                                    @foreach($v['options'] as $kq => $vq)
                                                                    <tr class="info">
                                                                      <th>{{$kq + 1}}</th>
                                                                        <td>{{$vq['option']}}</td>
                                                                    </tr>
                                                                    @endforeach
                                                                @endif
                                                                
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        
                                                        <a href="javascript:void(0)" class="question_status" @if($v['is_active']) title="Active" @else title="In-Active" @endif data-questionid={{$v['id']}} >
                                                        @if($v['is_active'])
                                                            <i class="fa fa-check" aria-hidden="true" style="color:green;"></i>
                                                        @else
                                                            <i class="fa fa-times" aria-hidden="true" style="color:red;"></i>
                                                        @endif
                                                        </a>
                                                       
                                                        &nbsp;&nbsp;&nbsp;
                                                      
                                                        <a href="{{url('admin/add-new-question/'.$v['id'])}}" title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>

                                                    </td>
                                                 </tr>
                                                @endforeach
                                            @else
                                                <td colspan="14" ><b>No Record Found.</b></td>
                                            @endif
                                           
                                            
                                        </tbody>
                                       
                                    </table>
                                    {{$questions->links()}}
                                </div>
                            </div>
                           
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
        </div>
    </section>
</div>
@endsection