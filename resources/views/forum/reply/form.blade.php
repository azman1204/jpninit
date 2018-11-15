@extends('app')
@section('content')
@section('title') Balasan @endsection
@include('include.err')
<form method="post" action="{{ url('reply/save') }}">
    <input type="hidden" name="id" value="{{ $reply->id }}">
    @csrf
    <div class="row">
        <div class="col-md-1">Kandungan</div>
        <div class="col-md-11">
            <textarea id="editor" name="content" class="form-control">{{ $reply->content }}</textarea>
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