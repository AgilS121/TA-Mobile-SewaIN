import 'package:flutter/material.dart';

class Users {
  final int id;
  final String name;
  final String email;
  final String alamat;
  final String no_telp;
  final String image;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.alamat,
    required this.no_telp,
    required this.image,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      alamat: json['alamat'] ?? '',
      no_telp: json['no_telp'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

// List<Users> user = [
//   Users(
//       id: 1,
//       nama: "Agil Satria",
//       email: "agilsatria@gmail.com",
//       alamat: "Bojongsari",
//       password: "123",
//       no_telp: 089665881651),
// ];
