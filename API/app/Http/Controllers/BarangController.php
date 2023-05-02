<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\BarangResource;
use App\Models\Barangs;
use App\Models\Members;
use Illuminate\Support\Facades\Auth;

class BarangController extends Controller
{
    public function index()
    {
        $barang = Barangs::all();

        return BarangResource::collection($barang);
    }

    public function show($id)
    {
        $barang = Barangs::with(['barang_kategori', 'barang_subkategori', 'barang_member'])->findOrFail($id);

        return new BarangResource($barang);
    }

    public function store(Request $request)
    {
        $dataLogin = Auth::user();

        if ($dataLogin->status=="members") {
                $validated = $request->validate([
                        'id_kategori' => 'required',
                        'id_subkategori' => 'required',
                        'nama_barang' => 'required|max:255',
                        'deskripsi' => 'required',
                        'image' => '',
                        'harga' => 'required',
                        'stok' => 'required'
                    ]);

            $request['id_member'] = $dataLogin->id;
            $barang = Barangs::create($request->all());
            return new BarangResource($barang->loadMissing('barang_member:id,nama_tempat'));
        } else {
            return response()->json([
                'message' => 'Unauthorized',
            ]);
        }
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'id_kategori' => '',
            'id_subkategori' => '',
            'nama_barang' => 'required|max:255',
            'deskripsi' => 'required',
            'image' => '',
            'harga' => '',
            'stok' => ''
        ]);

        $barang = Barangs::findOrFail($id);
        $barang->update($request->all());

        return new BarangResource($barang->loadMissing('barang_member:id,nama_tempat'));
    }

    public function destroy($id)
    {
        $barang = Barangs::findOrFail($id);
        $barang->delete();

        return new BarangResource($barang->loadMissing('barang_member:id,nama_tempat'));
    }
}
