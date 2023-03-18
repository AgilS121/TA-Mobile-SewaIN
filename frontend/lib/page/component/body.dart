import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text("belajarFlutter.com"),
        ),
        body: Image.asset('assets/images/1.jpg'),
    );
  }
}