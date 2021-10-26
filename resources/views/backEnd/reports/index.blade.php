@extends('backEnd.layouts.base')
@section('title', 'Reported Users ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid"> 
        <div class="box box-block bg-white">
            <h5 class="mb-1">Reported Users List</h5>
            <!-- <a href="{!! url('admin/postads/add') !!}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New Post Ad</a> -->
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Reported User</th>
                        <th>Reported By</th>
                        <th>Message</th>
                        <th>Date/Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($reports as $index => $report)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{ $report->userInfo2->name }}</td>
                        <td>{{ $report->userInfo1->name }}</td>
                        <td>{{ $report->message }}</td>
                        <td>
                            <?php
                                $date = new DateTime($report->created_at, new DateTimeZone('UTC'));
                                // $date->setTimezone(new DateTimeZone(Config('app.timezone_admin')));
                                echo $date->format('d M Y, h:i A');
                            ?>
                        </td>
                        <td>{{ ($report->report_status == '1') ? 'Solved' : 'Pending' }}</td>
                        <td>
                            @if($report->userInfo2->isBlocked == '0')
                            <form action="{{ url('admin/reported_users/block_user/'.$report->id) }}" method="post">    
                                {{ csrf_field() }}
                            
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to block this user')" title="Block User">Block</i></button>
                            </form>
                            @elseif($report->userInfo2->isBlocked == '1')
                            <form action="{{ url('admin/reported_users/unblock_user/'.$report->id) }}" method="post">    
                                {{ csrf_field() }}
                            
                                <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure you want to unblock this user')" title="Unblock User">Unblock</button>
                            </form>
                            @endif

                            @if($report->report_status == '0')
                                <a href="{{ url('admin/reported_users/mark_solved/'.$report->id) }}" class="btn btn-info" title="Mark Solved">Mark Solved</a>
                            @endif
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection