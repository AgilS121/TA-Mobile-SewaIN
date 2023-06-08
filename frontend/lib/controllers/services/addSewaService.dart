import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/page/Pembayaran/pembayaran.dart';
import 'package:http/http.dart' as http;

class SewaService {
  static Future<void> sewa(
    BuildContext context,
    String id_barang,
    String durasi_sewa,
    String total_harga,
    String accessToken,
  ) async {
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Penyewaan Behasil, Tunggu konfirmasi');
        final responseData = jsonDecode(response.body);
        final datasewa = {
          "id": responseData['data']['id'],
          "total_harga": responseData['data']['total_harga']
        };
        print('ini datasewa : $datasewa');
        print('ini response $responseData');

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pembayaran(
                      accessToken: accessToken,
                      databarang: {
                        "id": datasewa['id'],
                        "harga_total": datasewa['total_harga']
                      },
                      datasewa: datasewa,
                    )));
      } else if (response.statusCode == 400) {
        print('gagal menyewa');
      } else if (response.statusCode == 422) {
        print('gagal menyewa');
      } else if (response.statusCode == 500) {
        print('interval server error');
      } else {
        print('gagal : ${response.body}');
        print('gagal : ${response.statusCode}');
      }
    } catch (e) {
      print('Error : $e');
    }
  }
}
