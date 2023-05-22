import 'package:flutter/material.dart';
import 'package:frontend/page/Login/background_login.dart';
import 'package:frontend/page/Register/register.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/theme/pallete.dart';

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
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      // Wrap the Column with SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BackgroundLogin(),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "SELAMAT DATANG!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum memiliki akun? ",
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

  bool _isValidForm() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }
}
