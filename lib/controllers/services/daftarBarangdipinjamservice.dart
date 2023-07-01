import 'dart:convert';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/models/sewas.dart';
import 'package:http/http.dart' as http;

class daftarBarangdipinjamservice {
  static List<Sewa> sewamember = [];

  static Future<List<Sewa>> fetchBarangMember(String accesstoken) async {
    final url = Constans.apiUrl + '/sewaAll';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accesstoken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      sewamember =
          (data['data'] as List).map((item) => Sewa.fromJson(item)).toList();
      return sewamember;
    } else {
      throw Exception(
          'Gagal mengambil data : ${response.statusCode} == ${response.body}');
    }
  }
}
