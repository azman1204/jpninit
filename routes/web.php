<?php

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

// generate password
Route::get('pwd', function() {
    echo base64_encode(sha1('1234', true));
    //echo Hash::make('1234'); 
});


// middleware = prog. yg run sebelum execute intended prog
// web middleware - check user logged-in or not
Route::middleware(['auth'])->group(function() {
    Route::get('/article/list', 'ArticleController@listing');
    Route::get('/article/show', 'ArticleController@show');
    Route::post('/article/save', 'ArticleController@save');
    Route::get('/article/edit/{id}', 'ArticleController@edit');
    Route::get('/article/delete/{id}', 'ArticleController@delete');
    //Route::view('home', 'login.home');
    Route::get('home', function() {
        return view('login.home', ['user' => Auth::user()]);
    });
    Route::get('/todo/list', 'TodoController@listing');
    Route::get('/todo/show', 'TodoController@show');
    Route::post('/todo/save', 'TodoController@save');
    Route::get('/todo/edit/{id}', 'TodoController@edit');
    Route::get('/todo/delete/{id}', 'TodoController@delete');
    Route::get('/edoc/list/{id?}', 'EdocController@listing');
});

Route::middleware(['web'])->group(function() {
    Route::get('home2', function() {
        Auth::guard('abc');
        var_dump(Auth::guard('abc')->check());
        var_dump(Auth::id());
        var_dump(Auth::guard('abc')->user());
    });
    Route::get('login2', 'LoginController@auth2');
});

Route::get('login', 'LoginController@login')->name('login');
Route::get('logout', 'LoginController@logout');
Route::post('auth', 'LoginController@auth');


// URL with parameter (data). see ms 45
// http://localhost:8888/jpninit/public/user/123
Route::get('/user/{id}', function($id) {
    return "User ID = $id";
});

// http://localhost:8888/jpninit/public/sample/first
# kes #3
Route::get('/sample/first', 'SampleController@first');
# kes #4
Route::get('/sample/second', 'SampleController@second');
// http://localhost:8888/jpninit/public/sample/third/123/azman
// nama is optional
Route::get('/sample/third/{id}/{nama?}', 'SampleController@third');

// kes #1
// http://localhost:8888/jpninit/public/hello
Route::get('/hello/abc', function() {
    return "Hello World";
});

// kes #2
// http://localhost:8888/jpninit/public/hola
Route::get('hola', function() {
    return view('hola'); // /resources/views/hola.blade.php
});

// kes #2
// default page
Route::get('/', function () {
    return view('welcome');
});

//Route::get('hello', 'HelloController@world');