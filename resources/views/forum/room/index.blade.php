{{---------------------------------- 
views/forum/room/index.blade.php
@rooms
senarai discussion room
------------------------------------}}
@extends('app')
@section('title')
Forum JPN
@endsection

@section('content')
@if(App\Models\Role::isPriv(3))
<a href="{{url('room/create')}}" class="btn btn-primary btn-sm">Tambah Kategori</a>
@endif

<table class="table">
    @foreach($rooms as $room)
    <tr>
        <td><a href="{{url('post/index/'.$room->id)}}">{{$room->title}}</a></td>
        <td>{{$room->descr}}</td>
        @if (App\Models\Role::isPriv(3))
        <td>
            <a href="{{url('room/edit/'.$room->id)}}" class="fa fa-edit"></a>
            <a href="{{url('room/delete/'.$room->id)}}" class="fa fa-trash"></a>
        </td>
        @endif
    </tr>
    @endforeach
</table>
@endsection