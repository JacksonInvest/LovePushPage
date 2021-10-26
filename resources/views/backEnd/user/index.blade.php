@extends('backEnd.layouts.base')
@section('title', 'Users ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid"> 
        <div class="box box-block bg-white">
            <h5 class="mb-1">List Users</h5>
            
            <a href="{{ url('admin/user/add?type='.$type) }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New User</a>
           
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Added On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($users as $index => $user)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{$user->name}}</td>
                        <!-- <td>{{ ($user->gender == 1) ? 'Man' : 'Woman' }}</td> -->
                        <td>
                            <?php 
                                if($user->gender == 1) {
                                    echo "Male";
                                } else if($user->gender == 2) {
                                    echo "Female";
                                } else {
                                    echo "Other";
                                }
                            ?>
                        </td>
                        <td>{{$user->email}}</td>
                        <td>{{ ($user->status == '1') ? 'Active' : 'Inactive' }}</td>
                        <td>
                            <?php
                                $date = new DateTime($user->created_at, new DateTimeZone('UTC'));
                                // $date->setTimezone(new DateTimeZone(Config('app.timezone_admin')));
                                echo $date->format('d M Y, h:i A');
                            ?>
                         </td>
                        <td>
                            <form action="{{ url('admin/user/delete/'.$user->id.'?type='.$type) }}" method="post">    
                                {{ csrf_field() }}
                                <a href="{{ url('admin/user/edit/'.$user->id.'?type='.$type) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                            
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user? This user will not be able to sign in again ?')" title="Delete"><i class="fa fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection