@extends('backEnd.layouts.base')
@section('title', 'Schools ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">List Schools</h5>
            <a href="{{ url('admin/school/add') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New School</a>
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Added On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($schools as $index => $school)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{$school->name}}</td>
                        <td>{{ ($school->status == '1') ? 'Active' : 'Inactive' }}</td>
                        <td>
                            <?php
                                $date = new DateTime($school->created_at, new DateTimeZone('UTC'));
                                $date->setTimezone(new DateTimeZone(Config('app.timezone_admin')));
                                echo $date->format('d M Y, h:i A');
                            ?>
                         </td>
                        <td>
                            <form action="{{ url('admin/school/delete', $school->id) }}" method="post">    
                                {{ csrf_field() }}
                                <a href="{{ url('admin/school/edit', $school->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                            
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this school? this school users not be able to shows in app ?')" title="Delete"><i class="fa fa-trash"></i></button>
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