import 'package:flutter/material.dart';

class PenyewaTwoImageScreen extends StatefulWidget {
  const PenyewaTwoImageScreen({super.key});

  @override
  State<PenyewaTwoImageScreen> createState() => _PenyewaTwoImageScreenState();
}

class _PenyewaTwoImageScreenState extends State<PenyewaTwoImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Align(
            child: Container(
              child: Image.asset("assets/images/Group 6.png"),
            ),
          ),
        )
      ],
    );
  }
}
