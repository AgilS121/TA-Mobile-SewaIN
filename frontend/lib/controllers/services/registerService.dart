import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  static Future<void> register(
      BuildContext context,
      String name,
      String no_telp,
      String email,
      String password,
      String confirm_password) async {
    const url = Constans.apiUrl + '/register';
    final headers = {'Accept': 'application/json'};

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "name": name,
        "no_telp": no_telp,
        "email": email,
        "password": password,
        "password_confirmation": password,
      });

      if (response.statusCode == 200) {
        print('berhasil registrasi');
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['access_token'];

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } else if (response.statusCode == 400) {
        print('gagal registrasi');
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Gagal registrasi'),
                    content: const Text(
                        'Gagal registrasi, email sudah terdaftar dan cek password anda '),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      }
    } catch (e) {
      print('Error : $e');
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Register Gagal'),
                content: const Text('Ada Kesalahan Jaringan nih'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ],
              )));
    }
  }
}
