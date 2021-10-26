@extends('backEnd.layouts.base')
@section('title', 'Deleted Accounts ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid"> 
        <div class="box box-block bg-white">
            <h5 class="mb-1">Deleted Account List</h5>
           
            <table class="table table-striped table-bordered dataTable" id="table-2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Reasons</th>
                        <th>Description</th>
                        <th>Deleted On</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($deleted_accounts as $index => $deleted)
                    <tr>
                        <td>{{$index + 1}}</td>
                        <td>{{$deleted->name}}</td>
                        <td>{{$deleted->username}}</td>
                        <td>{{$deleted->email}}</td>
                        <td>{{$deleted->phone_code." ".$deleted->phone}}</td>
                        <td>{{$deleted->reasons}}</td>
                        <td>{{$deleted->description}}</td>
                        <td>
                            <?php
                                echo date('d M Y, h:i A', strtotime($deleted->created_at));
                            ?>
                         </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection