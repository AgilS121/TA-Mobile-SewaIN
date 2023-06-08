import 'dart:convert';

import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:http/http.dart' as http;

class ShowSewa {
  static Future fetchDetailSewa(String accessToken, String id) async {
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final url = Constans.apiUrl + '/sewa/$id';

    final header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('sukses');
        final data = jsonDecode(response.body);
        print('ini data dari show sewa service $data');
      } else {
        print('data gagal ${response.body} | ${response.statusCode}');
      }
    } catch (e) {
      print('ada yang salah $e');
    }
  }
}
