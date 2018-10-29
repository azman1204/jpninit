<?php
Route::get('/todo/list', 'TodoController@listing');




// URL with parameter (data). see ms 45
// http://localhost:8888/jpninit/public/user/123
Route::get('/user/{id}', function($id) {
 return "User ID = $id";
});


// http://localhost:8888/jpninit/public/sample/first
Route::get('/sample/first', 'SampleController@first');
Route::get('/sample/second', 'SampleController@second');
// http://localhost:8888/jpninit/public/sample/third/123/azman
// nama is optional
Route::get('/sample/third/{id}/{nama?}', 'SampleController@third');

// http://localhost:8888/jpninit/public/hello
Route::get('/hello/abc', function() {
    return "Hello World";
});

// http://localhost:8888/jpninit/public/hola
Route::get('hola', function() {
 return view('hola'); // /resources/views/hola.blade.php
});

// default page
Route::get('/', function () {
    return view('welcome');
});

//Route::get('hello', 'HelloController@world');