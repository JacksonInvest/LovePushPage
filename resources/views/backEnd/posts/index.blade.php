@extends('backEnd.layouts.base')
@section('title', 'Posts ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid"> 
        <div class="box box-block bg-white">
            <h5 class="mb-1">Posts List</h5>
            <!-- <a href="{!! url('admin/postads/add') !!}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Post Ad</a> -->
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th>Added On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($posts as $index => $post)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{ $post->userInfo->username }}</td>
                        <td>{{$post->title}}</td>
                        <td>{{ ($post->status == '1') ? 'Active' : 'Inactive' }}</td>
                        <td>
                            <?php
                                $date = new DateTime($post->created_at, new DateTimeZone('UTC'));
                                // $date->setTimezone(new DateTimeZone(Config('app.timezone_admin')));
                                echo $date->format('d M Y, h:i A');
                            ?>
                         </td>
                        <td>
                            <form action="{{ url('admin/posts/delete/'.$post->id) }}" method="post">    
                                {{ csrf_field() }}
                                <a href="{{ url('admin/posts/edit/'.$post->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                            
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this postads?')" title="Delete"><i class="fa fa-trash"></i></button>
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