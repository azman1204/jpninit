@if (count($errors) > 0)
<div class="alert alert-danger">
    There are some problems... <br>
    <ul>
        @foreach($errors->all() as $err)
        <li>{{ $err }}</li>
        @endforeach
    </ul>
</div>
@endif