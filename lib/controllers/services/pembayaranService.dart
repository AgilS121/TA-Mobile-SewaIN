import 'dart:convert';

import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:http/http.dart' as http;

class Pembayaran {
  static Future postPembayaranBank(String name, String email, String id_sewa,
      String total_harga, String bank, String accessToken) async {
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;

    final url = Constans.apiUrl + '/midtrans/buy';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "name": name,
        "email": email,
        "id_sewa": id_sewa,
        "total_harga": total_harga,
        "bank": bank
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('sukses');
      } else {
        print('gagal : ${response.body}');
        print('gagal : ${response.statusCode}');
      }
    } catch (e) {
      print('Error : $e');
    }
  }
}
