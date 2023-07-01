import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/logoutService.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/page/profile/components/image_profile.dart';
import 'package:frontend/page/profile/profile_edit.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final String accessToken;

  const Profile({super.key, required this.accessToken});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int id = 0;
  String userName = '';
  String image = 'download.png';
  String alamat = '';
  String no_telp = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final url = Constans.apiUrl + '/me';
    final tokenManager = TokenManager();
    tokenManager.accessToken = widget.accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    print('ini response: ${response.statusCode} || ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = data['data'];
      setState(() {
        id = user['user']['id'];
        userName = user['user']['name'];
        image = user['user']['image'];
        no_telp = user['user']['no_telp'];
        alamat = user['user']['alamat'];
        email = user['user']['email'];
      });
      print('ini data $data || ${user['user']['name']}');
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.bg),
        title: const Text(
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

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: ImageProfile(
          accessToken: widget.accessToken,
          datauser: {
            "id": id,
            "nama": userName,
            "email": email,
            "alamat": alamat,
            "no_telp": no_telp,
            "image": image
          },
        )),
        Expanded(
          flex: 2,
          child: Container(
            color: MyColors.bghome,
            child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editProfile(
                                        accessToken: widget.accessToken,
                                        datauser: {
                                          "id": id,
                                          "nama": userName,
                                          "email": email,
                                          "alamat": alamat,
                                          "no_telp": no_telp,
                                          "image": image
                                        },
                                      )));
                        },
                        leading: Image.asset("assets/images/User Circle.png"),
                        title: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: ListTile(
                        leading:
                            Image.asset("assets/images/Sign_out_circle.png"),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () =>
                            LogoutService.logout(context, widget.accessToken),
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
