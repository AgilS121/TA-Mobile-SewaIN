import 'dart:convert';
import 'dart:io';

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
      File image,
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
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields['_method'] = 'PATCH';
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
        final responseData = jsonDecode(response.reasonPhrase.toString());
      } else if (response.statusCode == 400) {
        print('Gagal menambahkan data');
      } else {
        print('Gagal regis ${response.statusCode} || ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
