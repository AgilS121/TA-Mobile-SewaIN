import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:http/http.dart' as http;

class SewaService {
  static Future<void> sewa(BuildContext context, String id_barang,
      String durasi_sewa, String total_harga, String accessToken) async {
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    const url = Constans.apiUrl + '/sewa';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "id_barang": id_barang,
        "id_penyewa": "8",
        "durasi_sewa": durasi_sewa,
        "jumlah_sewa": "1",
        "total_harga": total_harga
      });

      // print(id_barang);
      // print(durasi_sewa);
      // print(total_harga);
      // print(tokenManager.accessToken);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Penyewaan Behasil, Tunggu konfirmasi');
        final responseData = jsonDecode(response.body);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Penyewaan Behasil'),
                    content: const Text('Tunggu konfirmasi'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      } else if (response.statusCode == 400) {
        print('gagal menyewa');
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Gagal melakukan sewa'),
                    content: const Text('Gagal melakukan sewa'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      } else if (response.statusCode == 422) {
        print('gagal menyewa');
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Gagal melakukan sewa'),
                    content: const Text('Pastikan semua terisi'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      } else if (response.statusCode == 500) {
        print('interval server error');
      } else {
        print('gagal : ${response.body}');
        print('gagal : ${response.statusCode}');
      }
    } catch (e) {
      print('Error : $e');
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text(' Gagal'),
                content: const Text('Ada Kesalahan Jaringan nih'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ],
              )));
    }
  }
}
