import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:http/http.dart' as http;

class LogoutService {
  static Future<void> logout(BuildContext context, String accessToken) async {
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final url = Constans.apiUrl + '/logout';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        print('Logout berhasil');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,
        );
      } else {
        print('Logout gagal');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
