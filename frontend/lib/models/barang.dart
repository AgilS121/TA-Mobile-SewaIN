import 'package:flutter/material.dart';

import 'kategori.dart';

class Barang {
  final BigInt id;
  final BigInt id_kategori;
  final BigInt id_subkategori;
  final BigInt id_member;
  final String nama_barang;
  final String deskripsi;
  final String image;
  final int harga;
  final int stok;
  final Kategori kategori;

  Barang({
    required this.id,
    required this.id_kategori,
    required this.id_subkategori,
    required this.id_member,
    required this.nama_barang,
    required this.deskripsi,
    required this.image,
    required this.harga,
    required this.stok,
    required this.kategori,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: BigInt.from(json['id']),
      id_kategori: BigInt.from(json['id_kategori']),
      id_subkategori: BigInt.from(json['id_subkategori']),
      id_member: BigInt.from(json['id_member']),
      nama_barang: json['nama_barang'],
      deskripsi: json['deskripsi'],
      image: json['image'] as String? ?? '',
      harga: json['harga'],
      stok: json['stok'],
      kategori: Kategori.fromJson(json['kategori'] ?? ''),
    );
  }
}
