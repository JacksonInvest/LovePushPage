@extends('admin.master')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Users List
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
                        <div class="row">
                            <div class="col-sm-12">
                                <form class="form-horizontal mb40" method="post" action="{{url('admin/users')}}">
                                    @csrf
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="search" name="search" placeholder="Search here..." value="{{@$_POST['search']}}">
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                   
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                            <div class="row">
                                <div class="col-sm-6"></div>
                                <div class="col-sm-6">
                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    
                                    <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                        <thead>
                                            <tr role="row">
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Country</th>
                                                <th>City</th>
                                                <th>Address</th>
                                                <th>Gender</th>
                                                <th>Sexual Orientation</th>
                                                <th>Relationship</th>
                                                <th>Language</th>
                                                <th>Job</th>
                                                <th>Employer</th>
                                                <th>About Me</th>
                                                <th>Is Profile Complete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            @if($users->count())
                                                @foreach($users as $k => $v)
                                                <tr role="row" class="odd">
                                                    <td>{{$v['name']}}</td>
                                                    <td>{{$v['email']}}</td>
                                                    <td>{{$v['phone']}}</td>
                                                    <td>{{$v['country']}}</td>
                                                    <td>{{$v['city']}}</td>
                                                    <td>{{$v['address']}}</td>
                                                    <td>@if($v['gender'] == 1) Male @else Female @endif</td>
                                                    <td>@if($v['sexual_orientation'] == 1) Hetrosexual @elseif($v['sexual_orientation'] == 2) Bisexual @else Homesexual @endif</td>
                                                    <td>{{$v['relationship']}}</td>
                                                    <td>{{$v['language']}}</td>
                                                    <td>{{$v['job']}}</td>
                                                    <td>{{$v['employer']}}</td>
                                                    <td>{{$v['aboutme']}}</td>
                                                    <td>@if($v['is_profile_complete'] == 1) <span style="color:green;"> Completed </span> @else <span style="color:red"> Pending </span> @endif</td>
                                                 </tr>
                                                @endforeach
                                            @else
                                                <td colspan="14" ><b>No Record Found.</b></td>
                                            @endif
                                           
                                            
                                        </tbody>
                                       
                                    </table>
                                    {{$users->links()}}
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