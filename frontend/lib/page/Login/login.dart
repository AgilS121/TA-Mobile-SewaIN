import 'package:flutter/material.dart';
import 'package:frontend/page/Login/background_login.dart';
import 'package:frontend/page/Register/register.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/theme/pallete.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      BackgroundLogin(),
      Expanded(
          child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        // height: 430,
        // width: 393,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "SELAMAT DATANG!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
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
              Row(
                children: [
                  Text(
                    "Lupa Password?",
                    style: TextStyle(
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
                          bottomRight: Radius.circular(20))),
                  width: 355,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isValidForm()) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Root()));
                      }
                    },
                    child: Text("Masuk"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyColors.bg),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum memili account ? "),
                      Text(
                        "Daftar",
                        style: TextStyle(color: MyColors.bg),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ))
    ]);
    // ),
  }

  bool _isValidForm() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }
}
