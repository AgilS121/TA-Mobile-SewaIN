import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/usersService.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class editProfile extends StatefulWidget {
  final String accessToken;
  final Map<String, dynamic> datauser;
  const editProfile(
      {super.key, required this.accessToken, required this.datauser});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController no_telp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController email = TextEditingController();
  String image = 'download.png';
  int inisial = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.datauser['nama'];
    no_telp.text = widget.datauser['no_telp'];
    alamat.text = widget.datauser['alamat'];
    email.text = widget.datauser['email'];
    image = widget.datauser['image'];
    inisial = widget.datauser['id'];
  }

  File? selectedImage;
  final picker = ImagePicker();
  Future<void> getImage(bool isCamera) async {
    final pickedFile = await picker.getImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
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
        Expanded(
            child: Container(
          width: double.infinity,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: MyColors.bg, width: 2),
                ),
                child: ClipOval(
                  child: Center(
                    child: selectedImage != null
                        ? Image.file(selectedImage!, fit: BoxFit.cover)
                        : Image.network(
                            Constans.imageUrl + widget.datauser['image'],
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Photo Profile",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
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
                      width: 150,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Upload Foto'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Text('Ambil dari Kamera'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          getImage(true);
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      GestureDetector(
                                        child: Text('Pilih dari Galeri'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          getImage(false);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Unggah Foto",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: MyColors.bg),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        )),
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
                    readOnly: true,
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
                              selectedImage!,
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
