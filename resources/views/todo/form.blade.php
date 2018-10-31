@extends('app')
@section('content')
<legend>Form Todo</legend>

@if (count($errors) > 0)
<div class="alert alert-danger">
    There are some problems... <br>
    <ul>
        @foreach($errors->all() as $err)
        <li>{{ $err }}</li>
        @endforeach
    </ul>
</div>
@endif

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