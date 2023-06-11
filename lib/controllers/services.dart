import 'dart:convert';
import 'dart:io';

class Constans {
  static const String apiUrl = 'https://sewain.site/public/api';
  static const String imageUrl = 'https://sewain.site/public/images/';
}

String? getStringImage(File? file) {
  if (file == null) return null;
  return base64Encode(file.readAsBytesSync());
}
