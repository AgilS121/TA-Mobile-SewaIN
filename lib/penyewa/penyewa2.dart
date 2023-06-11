import 'package:flutter/material.dart';
import 'package:frontend/penyewa/components/penyewaTwo_image_screen.dart';
import 'package:frontend/penyewa/components/penyewaTwo_screen.dart';
import 'package:frontend/theme/pallete.dart';

class PenyewaTwo extends StatefulWidget {
  final String accesstoken;
  const PenyewaTwo({Key? key, required this.accesstoken});

  @override
  State<PenyewaTwo> createState() => _PenyewaTwoState();
}

class _PenyewaTwoState extends State<PenyewaTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: AppBar(
        backgroundColor: MyColors.bg,
      ),
      resizeToAvoidBottomInset: true,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Positioned(
            top: 158,
            left: 80,
            right: 80,
            child: Container(
              child: PenyewaTwoImageScreen(),
            ),
          ),
          Positioned.fill(
            top: 404,
            bottom: 0,
            child: PenyewaTwoScreen(
              accesstoken: widget.accesstoken,
            ),
          ),
        ],
      ),
    );
  }
}
