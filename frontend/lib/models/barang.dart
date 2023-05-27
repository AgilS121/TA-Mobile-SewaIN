import 'package:flutter/material.dart';

import 'kategori.dart';
import 'members.dart';

class Barang {
  final BigInt id;
  final BigInt id_kategori;
  final BigInt id_subkategori;
  final BigInt id_member;
  final String nama_barang;
  final String deskripsi;
  final List<String> durasi_sewa;
  final String image;
  final int harga;
  final int stok;
  final Kategori kategori;
  final Member member;

  Barang(
      {required this.id,
      required this.id_kategori,
      required this.id_subkategori,
      required this.id_member,
      required this.nama_barang,
      required this.deskripsi,
      required this.durasi_sewa,
      required this.image,
      required this.harga,
      required this.stok,
      required this.kategori,
      required this.member});

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: BigInt.from(json['id'] ?? 0),
      id_kategori: BigInt.from(json['id_kategori'] ?? 0),
      id_subkategori: BigInt.from(json['id_subkategori'] ?? 0),
      id_member: BigInt.from(json['id_member'] ?? 0),
      nama_barang: json['nama_barang'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      durasi_sewa: (json['durasi_sewa'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      image: json['image'] as String? ?? '',
      harga: json['harga'] ?? 0,
      stok: json['stok'] ?? 0,
      kategori: Kategori.fromJson(json['kategori'] ?? {}),
      member: Member.fromJson(json['member'] ?? {}),
    );
  }
}
