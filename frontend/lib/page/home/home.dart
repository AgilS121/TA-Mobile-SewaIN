import 'package:flutter/material.dart';
import 'package:frontend/components/profile_box.dart';
import 'package:frontend/page/home/components/home_image_screen.dart';
import 'package:frontend/page/home/components/home_screen.dart';
import 'package:frontend/page/profile/profile.dart';
import 'package:frontend/theme/pallete.dart';

class HomePage extends StatelessWidget {
  final String accessToken;
  final String status;

  const HomePage({
    Key? key,
    required this.accessToken,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileBox(
              number: 1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Profile(
                          accessToken: accessToken,
                        )),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Body(accessToken: accessToken, status: status),
    );
  }
}

class Body extends StatelessWidget {
  final String accessToken;
  final String status;

  const Body({
    Key? key,
    required this.accessToken,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(child: HomeImageScreen()),
                    ),
                    Positioned(
                      top: 260,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        color: MyColors.bghome,
                        child: HomeScreen(
                          accessToken: accessToken,
                          status: status,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
