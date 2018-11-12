@extends('app')
@section('content')
<legend>Senarai E-Dokumen</legend>
<a href="{{ url('edoc/doc') }}" class="btn btn-primary btn-sm">Tambah Dok</a>
<a href="{{ url('edoc/folder/'.$id) }}" class="btn btn-primary btn-sm">Tambah Folder</a>
<table class="table table-bordered">
    <!-- list kan semua folder (cat) --->
    @if (count($cats) > 0)
    <tbody>
        @foreach($cats as $cat)
        <tr>
            <td><a href="{{ url('edoc/list/'.$cat->id) }}">{{ $cat->name }}</a></td>
        </tr>
        @endforeach
    </tbody>
    @else
    <!-- list kan semua file / doc -->
    <tbody>
        @foreach($docs as $doc)
        <tr>
            <!-- klik link ini, open/show doc -->
            <td><a href="{{ url('edoc/doc/'.$doc->id) }}">{{ $doc->name }}</a></td>
        </tr>
        @endforeach
    </tbody>
    @endif
</table>
@endsection