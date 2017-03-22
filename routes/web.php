<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/

Route::get('/', 'MaterialsController@index');

Auth::routes();

Route::get('/home', 'MaterialsController@index');

Route::resource('/materials', 'MaterialsController');
Route::resource('/comentarios', 'ComentariosController');
Route::resource('/users', 'UsersController');

Route::get('/reportes/estadistico', 'ReportesController@index');