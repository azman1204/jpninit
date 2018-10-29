@extends('app')
@section('content')
<input type="button" class="btn btn-primary" value="My Button">
<h1>Hola</h1>
Nama saya {{ $nama }} dan saya tinggal di {{ $alamat }}
<br>
dan umur {{ $umur }}
<br>
Warna = {{ $warna }}, Jantina = {{ $jantina }}
Tarikh = {{ $tkh }}
{{-- ini komen blade --}}
<!-- komen html -->
@foreach($no as $bil)
<li>{{ $bil }}</li>
@endforeach
@endsection