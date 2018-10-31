@extends('app')
@section('content')
<legend>Senarai Artikel</legend>
<table class="table table-bordered">
    <thead>
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