import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/page/barangSewa/barang_sewa.dart';

import 'package:http/http.dart' as http;

class DeleteBarangMember {
  static Future<void> deleteBarang(
      BuildContext context, String id, String accessToken) async {
    final url = Constans.apiUrl + '/barang/$id';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        print('data berhasil didelete');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BarangSewa(
                    accesstoken: accessToken,
                  )),
        );
      } else {
        print(
            'data gagal didelete : ${response.statusCode} || ${response.body}');
      }
    } catch (e) {
      print('error : $e');
    }
  }
}
