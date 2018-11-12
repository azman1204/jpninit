@extends('app')
@section('content')
<legend>Dokumen</legend>
@include('include/err')
<form method="post" action="{{ url('doc/save') }}" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{ $doc->id }}">
    <input type="hidden" name="id_cat" value="{{ $id_cat }}">
    @csrf
    <div class="row">
        <div class="col-md-1">Nama</div>
        <div class="col-md-4">
            <input value="{{ $doc->name }}" type="text" name="name" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">Keterangan</div>
        <div class="col-md-11">
            <textarea id="editor" name="descr">{{ $doc->descr }}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">Muatnaik Dok</div>
        <div class="col-md-11">
            <input type="file" name="doc" class="form-control">
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