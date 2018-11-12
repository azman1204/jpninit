<!doctype html>
<html>
    <head>
        <title>My First Laravel App.</title>
        <link href="/jpninit/public/bootstrap-4.1.3/css/bootstrap.css" type="text/css" rel="stylesheet">
        <link href="/jpninit/public/css/layout.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <script src="{{ asset('jquery-ui-1.12.1/external/jquery/jquery.js') }}"></script>
        <script src="{{ asset('jquery-ui-1.12.1/jquery-ui.js') }}"></script>
        <link href="{{ asset('jquery-ui-1.12.1/jquery-ui.css') }}" rel="stylesheet" type="text/css"/>
        <script src="{{ asset('bootstrap-4.1.3/js/bootstrap.js') }}"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="header"></div>
            <div id="menu">@include('menu')</div>
            <div id="body">
                @yield('content')
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>