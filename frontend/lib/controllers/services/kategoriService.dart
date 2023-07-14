import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/kategori.dart';

class KategoriService {
  static List<Kategori> kategori = [];
  static Future getCategories(String accesstoken) async {
    final url = Constans.apiUrl + '/kategori';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accesstoken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    final response = await http.get(Uri.parse(url), headers: headers);

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
