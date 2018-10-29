<!doctype html>
<html>
    <head>
        <title>My First Laravel App.</title>
        <link href="/jpninit/public/bootstrap-4.1.3/css/bootstrap.css" type="text/css" rel="stylesheet">
        <link href="/jpninit/public/css/layout.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="wrapper">
            <div id="header"></div>
            <div id="menu"></div>
            <div id="body">
                @yield('content')
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>