import 'package:flutter/material.dart';
import 'package:frontend/penyewa/penyewa2.dart';
import 'package:frontend/theme/pallete.dart';

class Penyewa extends StatefulWidget {
  const Penyewa({super.key});

  @override
  State<Penyewa> createState() => _PenyewaState();
}

class _PenyewaState extends State<Penyewa> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/Group 5.png"),
        SizedBox(
          height: 10,
        ),
        Text(
          "Mari bergabung bersama kami !",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: 299,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PenyewaTwo()));
                },
                child: Text("Gabung",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: MyColors.bg,
                    ))))
      ],
    ));
  }
}
