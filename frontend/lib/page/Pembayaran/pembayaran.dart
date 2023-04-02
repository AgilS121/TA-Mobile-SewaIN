import 'package:flutter/material.dart';
import 'package:frontend/components/profile_box.dart';
import 'package:frontend/page/Pembayaran/components/pembayaran_image_screen.dart';
import 'package:frontend/page/Pembayaran/components/pembayaran_screen.dart';
import 'package:frontend/page/home/components/home_image_screen.dart';
import 'package:frontend/page/home/components/home_screen.dart';
import 'package:frontend/theme/pallete.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: AppBar(
        backgroundColor: MyColors.bg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Icon(color: Colors.white, Icons.arrow_back),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Pilih Metode Pembayaran",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
      body: body(),
    );
  }

  body() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: PembayaranImageScreen(),
          ),
          Flexible(flex: 2, child: PembayaranScreen())
        ]);
  }
}
