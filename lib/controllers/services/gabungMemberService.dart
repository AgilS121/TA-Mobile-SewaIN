import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/page/mitraSewa/mitra_sewa.dart';
import 'package:http/http.dart' as http;

class Join {
  static Future<void> regisMember(BuildContext context, String nama_tempat,
      String lokasi, String no_wa, String accessToken) async {
    final url = Constans.apiUrl + '/member-regis';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers,
          body: {"nama_tempat": nama_tempat, "lokasi": lokasi, "no_wa": no_wa});

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('berhasil menjadi member');
        final responseData = jsonDecode(response.body);

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Behasil'),
                    content: const Text('Berhasil Menjadi Member'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ]));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MitraSewa(accesstoken: accessToken)));
      } else {
        print(
            'gagal registrasi member : ${response.statusCode} || ${response.body}');
      }
    } catch (e) {
      print('error : $e');
    }
  }
}
