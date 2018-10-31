@extends('app')
@section('content')
<legend>Senarai Artikel</legend>
<a href="{{ url('article/show') }}" class="btn btn-primary btn-sm">Tambah Article</a>
<table class="table table-bordered">
    <thead class="thead-dark">
    <tr>
        <th>Bil.</th>
        <th>Tajuk</th>
        <th>Tarikh Cipta</th>
        <th>Tindakan</th>
    </tr>
    </thead>
    <tbody>
        @foreach($arts as $art)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>{{ $art->title }}</td>
            <td>{{ $art->created_at }}</td>
            <td>
                <a class="btn btn-success btn-sm" href="{{ url('article/edit/'.$art->id) }}">Edit</a>
                <a class="btn btn-danger btn-sm" href="{{ url('article/delete/'.$art->id) }}">Delete</a>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection