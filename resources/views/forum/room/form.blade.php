@extends('app')
@section('content')
@section('title') Tambah Kategori @endsection
@include('include.err')
<form method="post" action="{{ url('room/save') }}">
    <input type="hidden" name="id" value="{{ $room->id }}">
    @csrf
    <div class="row">
        <div class="col-md-1">Tajuk</div>
        <div class="col-md-4">
            <input value="{{ $room->title }}" type="text" name="title" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">Kandungan</div>
        <div class="col-md-11">
            <textarea id="editor" name="descr" class="form-control">{{ $room->descr }}</textarea>
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