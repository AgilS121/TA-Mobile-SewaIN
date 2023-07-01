import 'package:flutter/material.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:frontend/page/Register/register.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:frontend/page/intro/intro.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

Future<void> main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
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
      home: isViewed != 0 ? intro() : Login(),
      routes: {'/login': (context) => Login()},
    );
  }
}
