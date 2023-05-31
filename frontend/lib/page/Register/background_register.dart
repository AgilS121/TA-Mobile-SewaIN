import 'package:flutter/material.dart';

class BackgroundRegister extends StatefulWidget {
  const BackgroundRegister({super.key});

  @override
  State<BackgroundRegister> createState() => _BackgroundRegisterState();
}

class _BackgroundRegisterState extends State<BackgroundRegister> {
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
