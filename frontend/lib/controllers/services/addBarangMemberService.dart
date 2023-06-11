import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/page/barangSewa/barang_sewa.dart';
import 'package:http/http.dart' as http;

class AddBarangMember {
  static Future<void> addBarang(
    BuildContext context,
    String id_kategori,
    String id_subkategori,
    String nama_barang,
    String deskripsi,
    File image,
    String stok,
    String harga,
    String durasi_sewa,
    String accessToken,
  ) async {
    const url = Constans.apiUrl + '/barang';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields['id_kategori'] = id_kategori;
      request.fields['id_subkategori'] = id_subkategori;
      request.fields['nama_barang'] = nama_barang;
      request.fields['deskripsi'] = deskripsi;
      request.fields['stok'] = stok;
      request.fields['harga'] = harga;
      request.fields['durasi_sewa'] = durasi_sewa;

      if (image != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.path));
      }

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data berhasil ditambahkan');
        Navigator.pop(context);
      } else if (response.statusCode == 400) {
        print('Gagal menambahkan data');
      } else {
        print('Gagal regis ${response.statusCode} || ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error : $e');
    }
  }
}
