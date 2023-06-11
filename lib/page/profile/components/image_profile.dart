import 'package:flutter/material.dart';
import 'package:frontend/controllers/services/meService.dart';
import 'package:frontend/models/members.dart';
import 'package:frontend/models/users.dart';

class ImageProfile extends StatefulWidget {
  final String accessToken;

  const ImageProfile({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  Member? userData;

  void fetchData() async {
    try {
      final Member data = await Me.fetchUser(context, widget.accessToken);
      setState(() {
        userData = data;
      });
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print('userData: $userData');
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
          ),
          SizedBox(height: 10),
          Text(
            userData?.user.name ?? 'John Doe',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            userData?.user.email ?? 'Software Engineer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
