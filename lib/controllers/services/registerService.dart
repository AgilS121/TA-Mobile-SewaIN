import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:http/http.dart' as http;

Timer? _timer;

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

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('berhasil registrasi');
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['access_token'];

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } else if (response.statusCode == 400) {
        print('gagal registrasi');
        showDialog(
            context: context,
            builder: (BuildContext builderContext) {
              _timer = Timer(Duration(seconds: 5), () {
                Navigator.of(context).pop();
              });

              return AlertDialog(
                backgroundColor: Colors.red,
                title: Text('Title'),
                content: SingleChildScrollView(
                  child: Text('Content'),
                ),
              );
            }).then((val) {
          if (_timer!.isActive) {
            _timer!.cancel();
          }
        });
      } else if (response.statusCode == 422) {
        print('gagal regis ${response.statusCode}');
        print('gagal regis respon body ${response.body}');

        final message = jsonDecode(response.body);
        final datamessage = message['message'];
        print('ini messagee $datamessage');
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
