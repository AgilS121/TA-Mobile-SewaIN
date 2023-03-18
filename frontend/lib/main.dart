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
      title: "SewaIn",
      theme: ThemeData(
        primaryColor: warnalogin,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Welcome(),
    );
  }
}