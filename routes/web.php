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
    // display form add new folder
    Route::get('/edoc/folder/{id?}', 'EdocController@folder');
    // save form add new folder
    Route::post('/edoc/folder', 'EdocController@SaveFolder');
    // edit folder
    Route::get('/edoc/edit/{id}', 'EdocController@EditFolder');
    // delete folder
    Route::get('/edoc/delete/{id}', 'EdocController@DeleteFolder');
    
    // add new doc
    Route::get('/doc/form/{id_cat}', 'DocController@form');
    Route::post('/doc/save', 'DocController@save');
    Route::get('/doc/edit/{id}', 'DocController@edit');
    Route::get('/doc/delete/{id}', 'DocController@delete');
    Route::get('/doc/view/{id}', 'DocController@view');
    
    // Staff Directory
    Route::get('staff/search', 'StaffController@search');
    Route::post('staff/search', 'StaffController@search');
    Route::get('staff/view', 'StaffController@view');
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