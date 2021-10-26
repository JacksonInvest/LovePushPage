@extends('backEnd.layouts.base')
@section('title', 'User Report ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">User Reports</h5>
            <!-- <a href="{{ url('admin/school/add') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New School</a> -->
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>From User</th>
                        <th>To User</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($reports as $index => $report)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{ $report->user->name }}</td>
                        <td>{{ $report->fromUser->name }}</td>
                        <td>@if($report->status == 0) 
                            Pending
                            @elseif($report->status == 1)
                            User account inactive
                            @else
                            User report rejected
                            @endif
                         </td>
                        <td>
                            <a href="{{ url('admin/report/edit', $report->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
               
            </table>
        </div>
    </div>
</div>
@endsection