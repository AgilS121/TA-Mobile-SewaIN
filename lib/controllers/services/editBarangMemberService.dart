import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:http/http.dart' as http;

class EditBarangMember {
  static Future<void> barangMember(
      BuildContext context,
      BigInt id,
      String id_kategori,
      String id_subkategori,
      String nama_barang,
      String deskripsi,
      String image,
      String stok,
      String harga,
      String durasi_sewa,
      String accessToken) async {
    final url = Constans.apiUrl + '/barang/$id';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response =
          await http.patch(Uri.parse(url), headers: headers, body: {
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
        print('Update data barang berhasil');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Update Data Barang Berhasil'),
            content: Text('Data Anda Telah Diupdate'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
        final responseData = jsonDecode(response.body);
      } else {
        print(
            'Update data users gagal: ${response.statusCode} || ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Data Barang Gagal'),
          content: Text('Ada Kesalahan Jaringan nih'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
