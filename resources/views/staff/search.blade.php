@extends('app')
@section('content')
<div class=" col-md-6">
    <form method="post" action="{{url('staff/search')}}">
        @csrf
        <div class="row">
            <div class="col-md-12">
                Nama <input name="nama" type="text" class="form-control">
            </div>
            <div class="col-md-12">
                Negeri 
                <select name="negeri" class="form-control">
                    <option value="0">--Semua Negeri--</option>
                    @foreach(App\Models\Negeri::all() as $n)
                    <option value="{{$n->kod_negeri}}">{{$n->negeri}}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-12">
                Cawangan <select name="cawangan" class="form-control"></select>
            </div>
            <div class="col-md-12">
                <input type="submit" class="btn btn-primary" value="Cari">
            </div>
        </div>
    </form>
</div>

@if (isset($p))
<table class="table table-bordered" style="margin-top: 10px;">
    <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>Nama</th>
            <th>Email</th>
        </tr>
    </thead>
    @foreach($p as $staff)
    <tr>
        <td></td>
        <td>{{$staff->nama}}</td>
        <td>{{$staff->alamat_emel}}</td>
    </tr>
    @endforeach
</table>
@endif
@endsection
