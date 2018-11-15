@extends('app')
@section('title')
Forum JPN
@endsection

@section('content')
<a href="{{url('post/create')}}" class="btn btn-primary btn-sm">Tambah Post</a>
<table class="table">
    @foreach($posts as $post)
    <tr>
        <td>
            <a href="{{url('reply/index/'.$post->id)}}">{{$post->content}}</a>
            <br>
            <small><strong>Cipta Oleh</strong> : {{App\Models\User::find($post->post_by)->name}}</small>
            &nbsp;&nbsp;
            <small><strong>Tarikh Cipta</strong> : {{$post->created_at}}</small>
        </td>
        @if (App\Models\Role::isPriv(3) || Auth::user()->id == $post->post_by)
        <td>
            <a href="{{url('post/edit/'.$post->id)}}" class="fa fa-edit"></a>
            <a href="{{url('post/delete/'.$post->id)}}" class="fa fa-trash"></a>
        </td>
        @endif
    </tr>
    @endforeach
</table>
@endsection