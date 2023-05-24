// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/controllers/services.dart';
import 'package:http/http.dart' as http;

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

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Root(
              accessToken: accessToken,
            ),
          ),
        );
      } else if (response.statusCode == 401) {
        print('Login gagal cek email dan password');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Cek Email dan Password apakah sudah benar'),
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
      } else if (response.statusCode == 403) {
        print('Login gagal validasi email');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Validasi E-mail terlebih dahulu'),
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
      } else {
        print('Login gagal bukan user');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Anda bukan user, Registrasi terlebih dahulu.'),
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
