import 'package:flutter/material.dart';

class PembayaranImageScreen extends StatelessWidget {
  const PembayaranImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Align(
            child: Container(
              child: Image.asset("assets/images/E-Wallet-pana 1.png"),
            ),
          ),
        )
      ],
    );
  }
}
