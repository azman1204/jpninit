@extends('app')
@section('title') Forum JPN @endsection
@section('content')
<div style="border: 2px solid #ddd; border-radius: 50px 20px;padding: 10px;">
    {{$post->content}}
</div>
<a href="{{url('reply/create')}}" class="btn btn-primary btn-sm">Balas</a>
<table class="table">
    @foreach($replies as $reply)
    <tr>
        <td>
            {{$reply->content}}
            <br>
            <small><strong>Cipta Oleh</strong> : {{App\Models\User::find($reply->reply_by)->name}}</small>
            &nbsp;&nbsp;
            <small><strong>Tarikh Cipta</strong> : {{$reply->created_at}}</small>
        </td>
        @if (App\Models\Role::isPriv(3) || Auth::user()->id == $reply->created_by)
        <td>
            <a href="{{url('reply/edit/'.$reply->id)}}" class="fa fa-edit"></a>
            <a href="{{url('reply/delete/'.$reply->id)}}" class="fa fa-trash"></a>
        </td>
        @endif
    </tr>
    @endforeach
</table>
@endsection