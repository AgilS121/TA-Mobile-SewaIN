import 'package:frontend/models/users.dart';

class Member {
  final int id;
  final int id_users;
  final String nama_tempat;
  final String lokasi;
  final String no_wa;
  final Users user;

  Member(
      {required this.id,
      required this.id_users,
      required this.nama_tempat,
      required this.lokasi,
      required this.no_wa,
      required this.user});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['id'] ?? 0,
        id_users: json['id_users'] ?? 0,
        nama_tempat: json['nama_tempat'] ?? '',
        lokasi: json['lokasi'] ?? '',
        no_wa: json['no_wa'] ?? '',
        user: Users.fromJson(json['user'] ?? {}));
  }
}
