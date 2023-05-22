import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/background_login.dart';
import 'package:frontend/page/Register/register.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/page/home/home.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final url = Constans.apiUrl + '/login';
    final headers = {'Accept': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: {
          'email': emailController.text,
          'password': passwordController.text,
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
                  )),
        );
      } else if (response.statusCode == 401) {
        print('Login gagal cek email dan password');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Cek Email dan Password apakah sudah benar'),
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
      } else if (response.statusCode == 403) {
        print('Login gagal validasi email');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Validasi E-mail terlebih dahulu'),
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
      } else {
        print('Login gagal bukan user');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Anda bukan user, Registrasi terlebih dahulu.'),
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
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Ada Kesalahan Jaringan nih.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }

<<<<<<< HEAD
  body() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
=======
  Widget body() {
    return SingleChildScrollView(
      // Wrap the Column with SingleChildScrollView
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BackgroundLogin(),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
<<<<<<< HEAD
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: 300,
            width: 393,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
=======
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 35),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "SELAMAT DATANG!",
                    style: TextStyle(
<<<<<<< HEAD
                      fontWeight: FontWeight.w700,
=======
                      fontWeight: FontWeight.bold,
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
<<<<<<< HEAD
=======
                  SizedBox(height: 20),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
<<<<<<< HEAD
=======
                  SizedBox(height: 10),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
<<<<<<< HEAD
=======
                  SizedBox(height: 10),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                  Row(
                    children: [
                      Text(
                        "Lupa Password?",
                        style: TextStyle(
<<<<<<< HEAD
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
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
                          login();
                        },
                        child: Text("Masuk"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.bg),
                        ),
                      ),
                    ),
                  ),
=======
                            fontSize: 13,
                            color: MyColors.bg,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 355,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_isValidForm()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Root(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyColors.bg),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
<<<<<<< HEAD
                        MaterialPageRoute(builder: (context) => Register()),
=======
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
<<<<<<< HEAD
                        Text("Belum memili account ? "),
                        Text(
                          "Daftar",
                          style: TextStyle(color: MyColors.bg),
                        ),
=======
                        Text("Belum memiliki akun? ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100,
                                fontSize: 13)),
                        Text("Daftar",
                            style: TextStyle(
                                color: MyColors.bg,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
<<<<<<< HEAD
=======
  }

  bool _isValidForm() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
>>>>>>> 410faf8498098d211e863e244248dc1534ebd350
  }
}
