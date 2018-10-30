@extends('app')
@section('content')
<legend>Todo Listing</legend>
<table class="table table-bordered table-hover table-striped">
    <tr>
        <td>Name</td>
        <td>Task</td>
        <td>Action</td>
    </tr>
    @foreach($td as $todo)
    <tr>
        <td>{{ $todo->name }}</td>
        <td>{{ $todo->description }}</td>
        <td>
            <a href="{{ url('todo/edit/'.$todo->id) }}" class="btn btn-success btn-sm">Edit</a>
            <a href="{{ url('todo/delete/'.$todo->id) }}" class="btn btn-danger btn-sm">Del</a>
        </td>
    </tr>
    @endforeach
</table>
@endsection