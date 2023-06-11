import 'dart:convert';

import 'package:frontend/controllers/services.dart';
import 'package:frontend/models/barang.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static List<Barang> barang = [];

  static Future<List<Barang>> fetchBarang() async {
    final url = Constans.apiUrl + '/barang';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      barang =
          (data['data'] as List).map((item) => Barang.fromJson(item)).toList();
      return barang;
    } else {
      throw Exception('Gagal mengambil data: ${response.statusCode}');
    }
  }

  static Future<Barang> fetchDetailBarang(BigInt id) async {
    final url = Constans.apiUrl + '/barang/${id.toString()}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final barang = Barang.fromJson(data);
      return barang;
    } else {
      throw Exception('Gagal mengambil data: ${response.statusCode}');
    }
  }
}
