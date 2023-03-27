import 'package:flutter/material.dart';
import 'package:frontend/components/body.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:frontend/page/Register/background_register.dart';
import 'package:frontend/theme/pallete.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BackgroundRegister(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            // height: 700,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Daftar",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Pastikan mengisi data dengan baik dan benar",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 12),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Nama"), border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text("No Telepon"),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text("E-Mail"), border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Password"), border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Confirm Password"),
                        border: OutlineInputBorder()),
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
                        onPressed: () {},
                        child: Text("Daftar"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.bg),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah memiliki account ?"),
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
          ),
        )
      ],
    );
  }
}
