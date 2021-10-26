@extends('backEnd.layouts.base')
@section('title', 'Plans ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
        <div class="box box-block bg-white">
            <h5 class="mb-1">Plans List</h5>
            <!-- <a href="{{ url('admin/school/add') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New School</a> -->
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Subscriptions</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($plans as $index => $plan)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{$plan->name}}</td>
                        <td>{{ ($plan->price != '0.00') ? $plan->price : 'Free' }}</td>
                        <td>{{$plan->active_subscribed_plan_count}}</td>
                        <td>
                            @if($plan->status == "1")
                                Active
                            @else
                               InActive
                            @endif
                        </td>
                        <td>
                            <a href="{{ url('admin/plan_details', $plan->id) }}" class="btn btn-info" title="View Details"><i class="fa fa-eye"></i> </a>
                            <a href="{{ url('admin/plan_edit', $plan->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection