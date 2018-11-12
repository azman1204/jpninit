@extends('app')
@section('content')
<legend>Senarai E-Dokumen</legend>

@if ((count($cats) == 0 && count($docs) == 0) || count($cats) > 0)
    <!-- belum ada folder dan belum ada doc OR sudah ada folder -->
    <a href="{{ url('edoc/folder/'.$id) }}" class="btn btn-primary btn-sm">Tambah Folder</a>
@endif

@if (count($cats) == 0)
    <a href="{{ url('edoc/doc') }}" class="btn btn-primary btn-sm">Tambah Dok</a>
@endif

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