import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:http/http.dart' as http;

class UsersService {
  static Future<void> users(
    BuildContext context,
    int id,
    String name,
    String alamat,
    String no_telp,
    String email,
    String accessToken,
  ) async {
    final url = Constans.apiUrl + '/users/$id';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    print('id : $id');
    print('id : $name');
    print('id : $alamat');
    print('id : $no_telp');
    print('id : $email');
    print('id : ${tokenManager.accessToken}');
    print('url : $url');

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: {
          'name': name,
          'no_telp': no_telp,
          'alamat': alamat,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        print('Update data users berhasil');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Update Data User Berhasil'),
            content: Text('Data Anda Telah Diupdate'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
        final responseData = jsonDecode(response.body);
      } else {
        print('Update data users gagal: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Register Gagal'),
          content: Text('Ada Kesalahan Jaringan nih'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
