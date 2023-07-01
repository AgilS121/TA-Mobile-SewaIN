import 'dart:convert';

import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/models/sewas.dart';
import 'package:http/http.dart' as http;

class DataSewa {
  static List<Sewa> sewa = [];

  static Future<List<Sewa>> fetchSewa(String accessToken) async {
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final url = Constans.apiUrl + '/sewa';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    print('ini responnya ${response.statusCode}');
    // print('ini responnya ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      sewa = (data['data'] as List).map((e) => Sewa.fromJson(e)).toList();
      // print('ini sewa ${sewa}');
      return sewa;
    } else {
      throw Exception('Gagal mengambil data: ${response.statusCode}');
    }
  }
}
