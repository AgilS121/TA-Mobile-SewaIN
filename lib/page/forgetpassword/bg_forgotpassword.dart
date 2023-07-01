import 'package:flutter/material.dart';

class BackgorundForgotPassword extends StatefulWidget {
  const BackgorundForgotPassword({super.key});

  @override
  State<BackgorundForgotPassword> createState() =>
      _BackgorundForgotPasswordState();
}

class _BackgorundForgotPasswordState extends State<BackgorundForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Align(
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
              child: Image.asset("assets/images/register.png"),
            ),
          ),
        )
      ],
    );
  }
}
