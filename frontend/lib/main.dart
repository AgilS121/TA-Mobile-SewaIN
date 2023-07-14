import 'package:flutter/material.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/page/Login/login.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SewaIn extends StatefulWidget {
  const SewaIn({Key? key}) : super(key: key);

  @override
  _SewaInState createState() => _SewaInState();
}

class _SewaInState extends State<SewaIn> {
  bool isLoggedIn = false;
  String? accessToken;
  String? status;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedAccessToken = prefs.getString('accessToken');
    String? savedStatus = prefs.getString('status');

    if (savedAccessToken != null) {
      bool isTokenValid = await verifyAccessToken(savedAccessToken);

      if (isTokenValid) {
        setState(() {
          isLoggedIn = true;
          accessToken = savedAccessToken;
          status = savedStatus;
        });
      }
    }
  }

  Future<bool> verifyAccessToken(String accessToken) async {
    final url = Uri.parse(Constans.apiUrl + '/verify-token');
    final headers = {'Authorization': 'Bearer $accessToken'};

    try {
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        // Token valid
        return true;
      } else {
        // Token tidak valid
        return false;
      }
    } catch (e) {
      // Error saat melakukan permintaan
      print('Error: $e');
      return false;
    }
  }

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
      home: isLoggedIn && accessToken != null && status != null
          ? Root(accessToken: accessToken!, status: status!)
          : Login(),
      routes: {'/login': (context) => Login()},
    );
  }
}

Future<void> main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SewaIn());
}
