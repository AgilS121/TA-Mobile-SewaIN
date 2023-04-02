import 'package:flutter/material.dart';

class Users {
  final String nama, email, alamat, password;
  final int no_telp, id;

  Users({
    required this.id,
    required this.nama,
    required this.email,
    required this.alamat,
    required this.password,
    required this.no_telp,
  });
}

List<Users> user = [
  Users(
      id: 1,
      nama: "Agil Satria",
      email: "agilsatria@gmail.com",
      alamat: "Bojongsari",
      password: "123",
      no_telp: 089665881651),
];
