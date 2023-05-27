import 'package:flutter/material.dart';

class Users {
  final BigInt id;
  final String name;
  final String email;
  final DateTime email_verified_at;
  final int is_verified;
  final String password;
  final String alamat;
  final String no_telp;
  final String image;
  final String remember_token;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.email_verified_at,
    required this.is_verified,
    required this.password,
    required this.alamat,
    required this.no_telp,
    required this.image,
    required this.remember_token,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: BigInt.from(json['id'] ?? 0),
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        email_verified_at: json['email_verified_at'] ?? '',
        is_verified: json['is_verified'] as int? ?? 0,
        password: json['password'] ?? '',
        alamat: json['alamat'] ?? '',
        no_telp: json['no_telp'] ?? '',
        image: json['image'] ?? '',
        remember_token: json['remember_token'] ?? '');
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
