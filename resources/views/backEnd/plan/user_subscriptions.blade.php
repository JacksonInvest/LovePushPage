@extends('backEnd.layouts.base')
@section('title', 'Plans ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">User Plan Subscriptions</h5>
            <!-- <a href="{{ url('admin/school/add') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New School</a> -->
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>Plan Name</th>
                        <th>Started At</th>
                        <th>Recurring Payment ID</th>
                        <!-- <th>Action</th> -->
                    </tr>
                </thead>
                <tbody>
                @if(count($active_plans))
                    @foreach($active_plans as $index => $plan)
                        <tr>
                            <td>{{$index + 1}}</td>
                            <td>{{$plan->userInfo->username}}</td>
                            <td>{{$plan->plan->name}}</td>
                            <td>{{ date('d-m-Y H:i:s a', strtotime($plan->plan_started_at)) }}</td>
                            <td>{{$plan->paypal_trans_id}}</td>
                            <td>
                                <!-- <a href="{{ url('admin/plan_details', $plan->id) }}" class="btn btn-info" title="View Details"><i class="fa fa-eye"></i> </a>
                                <a href="{{ url('admin/plan_edit', $plan->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a> -->
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