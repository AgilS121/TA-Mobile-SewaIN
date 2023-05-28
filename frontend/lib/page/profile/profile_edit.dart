import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/controllers/services/meService.dart';
import 'package:frontend/controllers/services/usersService.dart';
import 'package:frontend/models/members.dart';
import 'package:frontend/page/profile/components/image_profile_edit.dart';
import 'package:frontend/theme/pallete.dart';

class editProfile extends StatefulWidget {
  final String accessToken;
  const editProfile({super.key, required this.accessToken});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController no_telp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController email = TextEditingController();
  int inisial = 0;

  Member? userData;

  void fetchData() async {
    try {
      final Member data = await Me.fetchUser(context, widget.accessToken);
      setState(() {
        userData = data;
        name.text = data.user.name;
        no_telp.text = data.user.no_telp;
        alamat.text = data.user.alamat;
        email.text = data.user.email;
        inisial = data.user.id;
      });
    } catch (e) {
      print('Failed to fecth data : $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.bg),
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black),
        ),
      ),
      body: body(),
    );
  }

  body() {
    print('ini inisial : $inisial');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: imageProfile_edit()),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            // height: 700,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      // labelText: 'Nama',
                      // hintText: userData?.user.name,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
                  TextField(
                    controller: no_telp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // labelText: 'No Telp',
                      // hintText: userData?.user.no_telp,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
                  TextField(
                    controller: alamat,
                    decoration: InputDecoration(
                      // labelText: 'Alamat',
                      // hintText: userData?.user.alamat,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      // labelText: 'E-Mail',
                      // hintText: userData?.user.email,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.bg),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      width: 355,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          UsersService.users(
                              context,
                              inisial,
                              name.text,
                              alamat.text,
                              no_telp.text,
                              email.text,
                              widget.accessToken);
                          print(name.text);
                          print(alamat.text);
                          print(no_telp.text);
                          print(email.text);
                        },
                        child: Text("Simpan"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.bg),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
