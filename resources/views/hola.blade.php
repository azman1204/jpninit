@extends('app')
@section('content')
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