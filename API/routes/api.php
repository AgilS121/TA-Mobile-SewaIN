<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\SubKategoriesController;
use App\Http\Controllers\AuthenticationController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\MidtransController;
use App\Http\Controllers\SewaController;

Route::middleware(['auth:sanctum'])->group(function () {
    // kategori
    Route::post('/kategori',[KategoriController::class, 'store']);
    Route::patch('/kategori/{id}',[KategoriController::class, 'update'])->middleware('kategori-post');
    Route::delete('/kategori/{id}',[KategoriController::class, 'destroy'])->middleware('kategori-post');

    // subkategori
    Route::post('/subkategori', [SubKategoriesController::class, 'store']);
    Route::patch('/subkategori/{id}', [SubKategoriesController::class, 'update'])->middleware('subkategori-post');
    Route::delete('/subkategori/{id}', [SubKategoriesController::class, 'destroy'])->middleware('subkategori-post');

    // barang
    Route::post('/barang', [BarangController::class, 'store']);
    Route::patch('/barang/{id}', [BarangController::class, 'update'])->middleware('barang-post');
    Route::delete('/barang/{id}', [BarangController::class, 'destroy'])->middleware('barang-post');

    //sewa
    Route::post('/sewa', [SewaController::class, 'store']);
    Route::patch('/sewa/{id}', [SewaController::class, 'update'])->middleware('sewa-post');
    Route::delete('/sewa/{id}', [SewaController::class, 'destroy'])->middleware('sewa-post');

    // auth
    Route::get('/logout', [AuthenticationController::class, 'logout']);
    Route::get('/me', [AuthenticationController::class, 'me']);

    // midtrans
    Route::post('/midtrans/buy', [MidtransController::class, 'buy']);

});

// barang
Route::get('/barang',[BarangController::class, 'index']);
Route::get('/barang/{id}',[BarangController::class, 'show']);

// kategori
Route::get('/kategori',[KategoriController::class, 'index']);
Route::get('/kategori/{id}',[KategoriController::class, 'show']);

//sewa
Route::get('/sewa',[SewaController::class, 'index']);
Route::get('/sewa/{id}',[SewaController::class, 'show']);

// subkategori
Route::get('/subkategori', [SubKategoriesController::class, 'index']);
Route::get('/subkategori/{id}', [SubKategoriesController::class, 'show']);
// Route::get('/subkategori2/{id}', [SubKategoriesController::class, 'show2']);

// login
Route::post('/login', [AuthenticationController::class, 'login']);

