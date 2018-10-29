@extends('app')
@section('content')
<legend>Todo Listing</legend>
<table class="table table-bordered table-hover table-striped">
    <tr>
        <td>Name</td>
        <td>Task</td>
    </tr>
    @foreach($td as $todo)
    <tr>
        <td>{{ $todo->name }}</td>
        <td>{{ $todo->description }}</td>
    </tr>
    @endforeach
</table>
@endsection