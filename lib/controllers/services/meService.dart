import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/models/members.dart';
import 'package:frontend/models/users.dart';
import 'package:http/http.dart' as http;

class Me {
  static Member? user;

  static Future<Member> fetchUser(
      BuildContext context, String accessToken) async {
    final url = Constans.apiUrl + '/me';
    final tokenManager = TokenManager();
    tokenManager.accessToken = accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    print('ini response : ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // final String name = responseData['member']['lokasi'];
      // print('coba objek');
      // print(name);
      final memberData = data['member'];
      print(memberData);
      final userData = data['user'];
      print(userData);
      user = Member(
        id: memberData['id'] ?? '',
        id_users: memberData['id_users'] ?? '',
        nama_tempat: memberData['nama_tempat'] ?? '',
        lokasi: memberData['lokasi'] ?? '',
        no_wa: memberData['no_wa'] ?? '',
        user: Users(
          id: userData['id'] ?? '',
          name: userData['name'] ?? '',
          email: userData['email'] ?? '',
          alamat: userData['alamat'] ?? '',
          no_telp: userData['no_telp'] ?? '',
          image: userData['image'] ?? '',
        ),
      );

      print('Lokasi: ${user?.lokasi}');
      print('Email: ${user?.user.email}');
      print('respon body: ${response.body}');
      return user!;
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}
