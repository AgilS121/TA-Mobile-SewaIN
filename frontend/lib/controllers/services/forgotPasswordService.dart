import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordService {
  static Future<void> GantiPassword(BuildContext context, String email,
      String password, String confirm_password) async {
    const url = Constans.apiUrl + '/forget-password';
    final headers = {'Accept': 'application/json'};

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "email": email,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('berhasil, silahkan cek email');
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['access_token'];

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } else if (response.statusCode == 400) {
        print('gagal');
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Gagal Ganti Password'),
                    content: const Text('Gagal Ganti password '),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ]));
      } else {
        print('gagal ganti password ${response.statusCode}');
      }
    } catch (e) {
      print('Error : $e');
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Ganti Password Gagal'),
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
