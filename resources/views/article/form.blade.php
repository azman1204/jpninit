@extends('app')
@section('content')
<legend>Artikel</legend>
<form method="post" action="{{ url('article/save') }}">
    <input type="hidden" name="id" value="">
    @csrf
    <div class="row">
        <div class="col-md-1">Tajuk</div>
        <div class="col-md-4">
            <input type="text" name="title" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">Kandungan</div>
        <div class="col-md-11">
            <textarea name="content" class="form-control"></textarea>
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