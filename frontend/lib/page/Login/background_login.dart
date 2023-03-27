import 'package:flutter/material.dart';

class BackgroundLogin extends StatefulWidget {
  const BackgroundLogin({super.key});

  @override
  State<BackgroundLogin> createState() => _BackgroundLoginState();
}

class _BackgroundLoginState extends State<BackgroundLogin> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Align(
            child: Container(
              // width: 317,
              // height: 317,
              padding:
                  EdgeInsets.only(top: 110, left: 38, right: 38, bottom: 56),
              child: Image.asset("assets/images/login.png"),
            ),
          ),
        ),
      ],
    );
  }
}
