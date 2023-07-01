import 'dart:convert';

import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/models/barang.dart';
import 'package:http/http.dart' as http;

class BarangMemberService {
  static List<Barang> barangmember = [];

  static Future<List<Barang>> fetchBarangMember(String accesstoken) async {
    final url = Constans.apiUrl + '/barangmember';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accesstoken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      barangmember =
          (data['data'] as List).map((item) => Barang.fromJson(item)).toList();
      return barangmember;
    } else {
      throw Exception(
          'Gagal mengambil data : ${response.statusCode} == ${response.body}');
    }
  }
}
