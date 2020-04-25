<?php

use Illuminate\Support\Facades\Route;

Route::get('/photos/{photo}/download', 'PhotoController@download');
Route::get('/{any?}', fn() => view('index'))->where('any', '.+');
