@extends('backEnd.layouts.base')
@section('title', ': FAQ')
@section('content')

    <div class="content-area py-1">
        <div class="container-fluid">
            <div class="box box-block bg-white">
                <h5 class="mb-1">FAQ's List</h5>
                <a href="{{ url('admin/faq/add') }}" style="margin-left: 1em;" class="btn btn-primary pull-right"><i class="fa fa-plus"></i> Add New FAQ</a>

                <table class="table table-striped table-bordered dataTable" id="table-2">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Language</th>
                            <th>Category</th>
                            <th>Question</th>
                            <!-- <th>Status</th> -->
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($faqs as $index => $value)
                        <tr>
                            <td>{{$index + 1}}</td>
                            <td>
                                @if($value->language_id == 1)
                                    English
                                @elseif($value->language_id == 2)
                                    German
                                @endif
                            </td>
                            <td>{{$value->ques_type}}</td>
                            <td>{{$value->question}}</td>
                            <td>
                                <form action="{{ url('admin/faq/delete', $value['id']) }}" method="post">    
                                    {{ csrf_field() }}
                                    <a href="{{ url('admin/faq/edit/'.$value->id) }}" class="btn btn-info" title="Edit"><i class="fa fa-pencil"></i> </a>
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure?')" title="Delete"><i class="fa fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                        <!-- <td> ($value['status'] == '1') ? 'Active' : 'Inactive' </td> -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection