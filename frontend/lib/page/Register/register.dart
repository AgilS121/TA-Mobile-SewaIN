// ignore_for_file: sort_child_properties_last, avoid_print, use_build_context_synchronously, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:frontend/page/Register/background_register.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController no_telp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      resizeToAvoidBottomInset: true,
    );
  }

  body() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const BackgroundRegister(),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          height: 700,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Daftar",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Pastikan mengisi data dengan baik dan benar",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 12),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',
                    labelText: 'Nama',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                  ),
                ),
                TextField(
                  controller: no_telp,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'No Telepon/WA',
                    labelText: 'No Telp',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                  ),
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Alamat Email',
                    labelText: 'E-Mail',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                  ),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                  ),
                ),
                TextField(
                  controller: confirm_password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg),
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: 355,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      child: const Text("Daftar"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyColors.bg),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sudah memiliki account ?"),
                      Text(
                        "Login",
                        style: TextStyle(color: MyColors.bg),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Future<void> register() async {
    const url = Constans.apiUrl + '/register';
    final headers = {'Accept': 'application/json'};

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "name": name.text,
        "no_telp": no_telp.text,
        "email": email.text,
        "password": password.text,
        "password_confirmation": password.text,
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
                title: const Text('Login Gagal'),
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
