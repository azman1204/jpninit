@extends('app')
@section('content')
<legend>Tambah Folder</legend>
@include('include/err')
<form method="post" action="{{ url('edoc/folder') }}">
    <input type="hidden" name="id" value="{{ $cat->id }}">
    <input type="hidden" name="parent_id" value="{{ $id }}">
    @csrf
    <div class="row">
        <div class="col-md-1">Tajuk</div>
        <div class="col-md-4">
            <input value="{{ $cat->name }}" type="text" name="name" class="form-control">
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