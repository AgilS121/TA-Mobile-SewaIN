import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/kategori.dart';

class KategoriService {
  static List<Kategori> kategori = [];
  static Future getCategories() async {
    final url = Constans.apiUrl + '/kategori';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // kategori = (data['data'] as List)
      //     .map((item) => Kategori.fromJson(item))
      //     .toList();
      return data;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
