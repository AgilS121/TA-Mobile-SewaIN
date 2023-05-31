import 'package:flutter/material.dart';

class HomeImageScreen extends StatelessWidget {
  const HomeImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 120),
          child: Text(
            "Mau Pinjam Apa Hari Ini ?",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.white),
          ),
        ),
        ClipRRect(
          child: Align(
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 200),
              child: Image.asset("assets/images/Teachers' Day-pana 2.png"),
            ),
          ),
        )
      ],
    );
  }
}
