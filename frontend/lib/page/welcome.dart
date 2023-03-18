import 'package:flutter/material.dart';
import 'package:frontend/page/component/body.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }
}