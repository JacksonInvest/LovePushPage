@extends('backEnd.layouts.base')
@section('title', 'PostAds ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid"> 
        <div class="box box-block bg-white">
            <h5 class="mb-1">Post Ads List</h5>
            <a href="{!! url('admin/postads/add') !!}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Post Ad</a>
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Post type</th>
                        <th>Status</th>
                        <th>Added On</th>
                        <th>Approval</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($postads as $index => $postad)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{$postad->title}}</td>
                        <td>{{ ($postad->post_type == 1) ? 'Love Ads' : 'Connected Ads' }}</td>
                        <td>{{ ($postad->status == '1') ? 'Active' : 'Inactive' }}</td>
                        <td>
                            <?php
                                $date = new DateTime($postad->created_at, new DateTimeZone('UTC'));
                                // $date->setTimezone(new DateTimeZone(Config('app.timezone_admin')));
                                echo $date->format('d M Y, h:i A');
                            ?>
                        </td>
                        <td>
                            @if($postad->approval == '0')
                                Pending
                            @elseif($postad->approval == '1')
                                Approved
                            @endif
                        </td>
                        <td>
                            <form action="{{ url('admin/postad/delete/'.$postad->id) }}" method="post">    
                                {{ csrf_field() }}
                                @if($postad->approval == '0')
                                    <a href="{{ url('admin/postad/approve/'.$postad->id) }}" class="btn btn-success" title="Approve"><i class="fa fa-check"></i> </a>
                                @elseif($postad->approval == '1')
                                    <a href="{{ url('admin/postad/disapprove/'.$postad->id) }}" class="btn btn-danger" title="Disapprove"><i class="fa fa-close"></i> </a>
                                @endif
                                <a href="{{ url('admin/postad/edit/'.$postad->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                            
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