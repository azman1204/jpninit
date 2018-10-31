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
            <td>Edit | Delete</td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection