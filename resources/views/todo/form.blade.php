@extends('app')
@section('content')
<legend>Form Todo</legend>
<form method="post" action="{{ url('todo/save') }}">
    <input type="hidden" name="id" value="{{ $td->id }}">
    @csrf
    Name : <input type="text" name="name" value="{{ $td->name }}">
    <br>
    Desc : <textarea name="description">{{ $td->description }}</textarea>
    <br>
    <input type="submit" value="Save">
</form>
@endsection