import 'package:flutter/material.dart';
import 'package:frontend/components/profile_box.dart';
import 'package:frontend/page/home/components/home_image_screen.dart';
import 'package:frontend/page/home/components/home_screen.dart';
import 'package:frontend/page/profile/profile.dart';
import 'package:frontend/theme/pallete.dart';

class HomePage extends StatefulWidget {
  final String accessToken;
  const HomePage({Key? key, required this.accessToken}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                              accessToken: widget.accessToken,
                            ))));
              },
            )
          ],
        ),
      ),
      body: body(),
    );
  }

  body() {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Expanded(
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
              height: 700,
              child: Container(
                  color: MyColors.bghome,
                  child: HomeScreen(
                    accessToken: widget.accessToken,
                  )),
            ),
          ],
        ))
      ]),
    ));
  }
}
