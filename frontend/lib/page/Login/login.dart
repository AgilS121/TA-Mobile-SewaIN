// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services/loginService.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      // Wrap the Column with SingleChildScrollView
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BackgroundLogin(),
          // SizedBox(
          //   height: 135,
          // ),
          Container(
            height: 486,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "SELAMAT DATANG!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Lupa Password?",
                        style: TextStyle(
                            fontSize: 13,
                            color: MyColors.bg,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 355,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginService.login(
                          context,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: const Text(
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
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Belum memiliki akun? ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
                        Text("Daftar",
                            style: TextStyle(
                                color: MyColors.bg,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
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
  }
}
