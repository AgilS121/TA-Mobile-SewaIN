import 'dart:convert';

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
      String image,
      String stok,
      String harga,
      String durasi_sewa,
      String accessToken) async {
    const url = Constans.apiUrl + '/barang';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "id_kategori": id_kategori,
        "id_subkategori": id_subkategori,
        "nama_barang": nama_barang,
        "deskripsi": deskripsi,
        "image": image,
        "stok": stok,
        "harga": harga,
        "durasi_sewa": durasi_sewa
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('tambah data berhasil');
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['access_token'];

        Navigator.pop(context);
      } else if (response.statusCode == 400) {
        print('gagal tambah data');
      } else {
        print('gagal regis ${response.statusCode} || ${response.body}');
      }
    } catch (e) {
      print('Error : $e');
    }
  }
}
