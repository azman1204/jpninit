@extends('app')
@section('content')
<legend>Artikel</legend>
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
<form method="post" action="{{ url('article/save') }}">
    <input type="hidden" name="id" value="{{ $art->id }}">
    @csrf
    <div class="row">
        <div class="col-md-1">Tajuk</div>
        <div class="col-md-4">
            <input value="{{ $art->title }}" type="text" name="title" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">Kandungan</div>
        <div class="col-md-11">
            <textarea name="content" class="form-control">{{ $art->content }}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-4">
            <input type="submit" value="Simpan" class="btn btn-primary">
        </div>
    </div>
</form>
@endsection