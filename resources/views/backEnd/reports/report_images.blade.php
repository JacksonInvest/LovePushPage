@extends('backEnd.layouts.base')
@section('title', 'Reported Images ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid"> 
        <div class="box box-block bg-white">
            <h5 class="mb-1">Reported Images</h5>
            <!-- <a href="{!! url('admin/postads/add') !!}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Post Ad</a> -->
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Reported By</th>
                        <th>Reported User</th>
                        <th>Image Type</th>
                        <th>Reported Date/Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @if(isset($report_images))
                    @foreach($report_images as $index => $report_image)
                        <tr>
                            <td>{{$index + 1}}</td>
                            <td>{{ @$report_image->user->name }}</td>
                            <td>{{ @$report_image->reported_user->name }}</td>
                            <td>
                                @if($report_image->type == "profile_image")
                                    Profile Image
                                @elseif($report_image->type == "post")
                                    Post
                                @elseif($report_image->type == "post_ad")
                                    Post Ad
                                @endif
                            </td>
                            <td>
                                <?php
                                    $date = new DateTime($report_image->created_at, new DateTimeZone('UTC'));
                                    echo $date->format('d M Y, h:i A');
                                ?>
                            </td>
                            <td>{{ ($report_image->status == '1') ? 'Solved' : 'Pending' }}</td>
                            <td>
                                @if($report_image->status == '0')
                                    <a href="{{ url('admin/report_images/mark_solved/'.$report_image->id) }}" class="btn btn-info" title="Mark Solved">View</a>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection