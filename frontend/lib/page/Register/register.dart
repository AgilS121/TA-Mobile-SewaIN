import 'package:flutter/material.dart';
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
      resizeToAvoidBottomInset: false,
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BackgroundRegister(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Daftar",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6), // Jarak antara judul dan teks berikutnya
                  Text(
                    "Pastikan mengisi data dengan baik dan benar",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                      height: 20), // Jarak antara teks berikutnya dan TextField
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Jarak antara TextField
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'No Telp',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Jarak antara TextField
                  TextField(
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
                  SizedBox(height: 10), // Jarak antara TextField
                  TextField(
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
                  SizedBox(height: 10), // Jarak antara TextField
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
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
                      height: 15), // Jarak antara TextField dan Tombol Daftar
                  SizedBox(
                    width: 355,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Daftar",
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
                  SizedBox(
                      height:
                          10), // Jarak antara Tombol Daftar dan teks "Sudah memiliki account ?"
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah memiliki akun?",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
                        SizedBox(width: 5), // Jarak antara teks
                        Text("Login",
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
