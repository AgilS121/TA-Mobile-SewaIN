import 'package:flutter/material.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/page/Pembayaran/pembayaran.dart';
import 'package:frontend/page/pp/photo_profie.dart';
import 'package:frontend/theme/pallete.dart';

void main(List<String> args) {
  runApp(const SewaIn());
}

class SewaIn extends StatelessWidget {
  const SewaIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SewaIn",
      theme: ThemeData(
        primaryColor: MyColors.bg,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: MyColors.bg,
      ),
      home: Pembayaran(),
    );
  }
}
