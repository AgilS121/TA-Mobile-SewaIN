import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:frontend/page/profile/components/image_profile.dart';
import 'package:frontend/page/profile/profile_edit.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  final String accessToken;

  const Profile({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> logout() async {
    final url = Constans.apiUrl + '/logout';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${widget.accessToken}'
    };
    print(widget.accessToken);
    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        print('Logout berhasil');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,
        );
      } else {
        print('Logout gagal');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.bg),
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black),
        ),
      ),
      body: body(),
    );
  }

  body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: imageProfile()),
        Expanded(
          flex: 2,
          child: Container(
            color: MyColors.bghome,
            child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editProfile()));
                    },
                    leading: Image.asset("assets/images/User Circle.png"),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    leading: Image.asset("assets/images/Sign_out_circle.png"),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: logout,
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
