@extends('app')
@section('content')
<legend>Senarai E-Dokumen</legend>
<a href="{{ url('article/show') }}" class="btn btn-primary btn-sm">Tambah Dok</a>
<table class="table table-bordered">
    <tbody>
        @foreach($cats as $cat)
        <tr>
            <td>{{ $cat->name }}</td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection