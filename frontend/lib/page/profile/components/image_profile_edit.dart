import 'package:flutter/material.dart';
import 'package:frontend/theme/pallete.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class imageProfile_edit extends StatefulWidget {
  const imageProfile_edit({super.key});

  @override
  State<imageProfile_edit> createState() => _imageProfile_editState();
}

class _imageProfile_editState extends State<imageProfile_edit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 20,
          ),
          const CircleAvatar(
            radius: 80,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Photo Profile",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                child: Container(
                  decoration: const BoxDecoration(
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
                    onPressed: () {},
                    child: Text(
                      "Unggah Foto",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyColors.bg),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
