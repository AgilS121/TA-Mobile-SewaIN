import 'package:flutter/material.dart';

class introModel {
  String img;
  String text;
  Color bg;
  Color button;

  introModel({
    required this.img,
    required this.text,
    required this.bg,
    required this.button,
  });
}

List<introModel> screens = <introModel>[
  introModel(
    img: "assets/images/intro1.png", 
    text: "", 
    bg: Color.fromARGB(255, 105, 192, 255), 
    button: Color.fromARGB(255, 105, 192, 255)
  ),
  introModel(
    img: "assets/images/intro2.png", 
    text: "Tempat yang tepat untuk mencari barang sewaan", 
    bg: Color.fromARGB(255, 105, 192, 255), 
    button: Color.fromARGB(255, 105, 192, 255)
  ),
  introModel(
    img: "assets/images/intro3.png", 
    text: "Barang terjamin karena dikirim langsung oleh pemilik barang", 
    bg: Color.fromARGB(255, 105, 192, 255), 
    button: Color.fromARGB(255, 105, 192, 255)
  ),
];