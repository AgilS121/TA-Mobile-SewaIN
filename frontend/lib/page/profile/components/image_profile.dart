import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/models/members.dart';
import 'package:frontend/models/users.dart';

class ImageProfile extends StatefulWidget {
  final String accessToken;
  final Map<String, dynamic> datauser;

  const ImageProfile(
      {Key? key, required this.accessToken, required this.datauser})
      : super(key: key);

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage(Constans.imageUrl + widget.datauser['image']),
          ),
          SizedBox(height: 10),
          Text(
            widget.datauser['nama'] ?? 'Agil',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.datauser['email'] ?? 'Software Engineer',
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
