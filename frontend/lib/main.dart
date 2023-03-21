import 'package:flutter/material.dart';
import 'package:frontend/page/welcome.dart';
import 'package:frontend/pallete/pallete.dart';

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
      home: Welcome(),
    );
  }
}