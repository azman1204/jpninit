@extends('app')

@section('title')
Senarai E-Dokumen
@endsection

@section('content')

@if ((count($cats) == 0 && count($docs) == 0) || count($cats) > 0)
    <!-- belum ada folder dan belum ada doc OR sudah ada folder -->
    <a href="{{ url('edoc/folder/'.$id) }}" class="btn btn-primary btn-sm">Tambah Folder</a>
@endif

@if (count($cats) == 0)
    <a href="{{ url('doc/form/'.$id) }}" class="btn btn-primary btn-sm">Tambah Dok</a>
@endif

<table class="table table-bordered">
    <!-- list kan semua folder (cat) --->
    @if (count($cats) > 0)
    <tbody>
        @foreach($cats as $cat)
        <tr>
            <td><span class="fa fa-folder fa-2x"></span> <a href="{{ url('edoc/list/'.$cat->id) }}">{{ $cat->name }}</a></td>
            @if (App\Models\Role::isPriv(1))
            <td>
                <a href="{{ url('edoc/edit/'.$cat->id) }}" class="fa fa-edit"></a>
                <a href="{{ url('edoc/delete/'.$cat->id) }}" onclick="return confirm('Anda Pasti ?')" class="fa fa-trash-alt" style="color:red"></a>
            </td>
            @endif
        </tr>
        @endforeach
    </tbody>
    @else
    <!-- list kan semua file / doc -->
    <tbody>
        @foreach($docs as $doc)
        <tr>
            <!-- klik link ini, open/show doc -->
            <!--<td><a href="{{ url('storage/doc/'.$doc->hash_name) }}">{{ $doc->name }}</a></td>-->
            <td><a href="{{ url('/doc/view/'.$doc->id) }}">{{ $doc->name }}</a></td>
            @if (App\Models\Role::isPriv(1))
            <td>
                <a href="{{url('doc/edit/'.$doc->id)}}" class="fa fa-edit"></a>
                <a href="{{url('doc/delete/'.$doc->id)}}" class="fa fa-trash"></a>
            </td>
            @endif
        </tr>
        @endforeach
    </tbody>
    @endif
</table>
@endsection