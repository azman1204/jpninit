@extends('app')
@section('content')
<legend>Welcome {{ $user->nama }}</legend>
<a href="http://localhost:8888/mysample/public/sso/{{$sess}}">MySample</a>
@endsection