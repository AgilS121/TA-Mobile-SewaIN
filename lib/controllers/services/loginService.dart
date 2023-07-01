// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/controllers/services.dart';
import 'package:http/http.dart' as http;

Timer? _timer;

class LoginService {
  static Future<void> login(
      BuildContext context, String email, String password) async {
    const url = Constans.apiUrl + '/login';
    final headers = {'Accept': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('berhasil');
        // Login berhasil
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['access_token'];
        print(accessToken);

        final memberData = responseData['member'];
        final status = memberData != null ? memberData['status'] ?? '' : '';

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Root(
              accessToken: accessToken,
              status: status,
            ),
          ),
        );
      } else {
        print('Login gagal bukan user');
        final message = jsonDecode(response.body);
        final datamessage = message['message'];
        print('data errors $datamessage');
        showDialog(
            context: context,
            builder: (BuildContext builderContext) {
              _timer = Timer(Duration(seconds: 5), () {
                Navigator.of(context).pop();
              });

              return AlertDialog(
                backgroundColor: Colors.red,
                title: Text('Gagal Registrasi'),
                content: SingleChildScrollView(
                  child: Text(datamessage),
                ),
              );
            }).then((val) {
          if (_timer!.isActive) {
            _timer!.cancel();
          }
        });
      }
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Gagal'),
          content: const Text('Ada Kesalahan Jaringan nih.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
