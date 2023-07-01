import 'dart:convert';
import 'dart:io';

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
    File image,
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
    // print('id : $name');
    // print('id : $alamat');
    // print('id : $no_telp');
    // print('id : $email');
    // print('id : ${tokenManager.accessToken}');
    // print('url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields['_method'] = 'PATCH';
      request.fields['name'] = name;
      request.fields['no_telp'] = no_telp;
      request.fields['alamat'] = alamat;
      request.fields['email'] = email;

      if (image != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.path));
      }

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Update data User berhasil');
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
        final responseData = jsonDecode(response.reasonPhrase.toString());
      } else if (response.statusCode == 400) {
        print('Gagal menambahkan data');
      } else {
        print('Gagal regis ${response.statusCode} || ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
