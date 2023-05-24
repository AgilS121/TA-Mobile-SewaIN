import 'package:flutter/material.dart';
import 'package:frontend/controllers/services/logoutService.dart';
import 'package:frontend/page/profile/components/image_profile.dart';
import 'package:frontend/page/profile/profile_edit.dart';
import 'package:frontend/theme/pallete.dart';

class Profile extends StatefulWidget {
  final String accessToken;

  const Profile({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(child: imageProfile()),
        Expanded(
          flex: 2,
          child: Container(
            color: MyColors.bghome,
            child: ListView(padding: const EdgeInsets.all(10.0), children: <
                Widget>[
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const editProfile()));
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    leading: Image.asset("assets/images/Sign_out_circle.png"),
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
