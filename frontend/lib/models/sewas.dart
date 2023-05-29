import 'dart:ffi';

import 'package:frontend/models/kategori.dart';

import 'barang.dart';

class Sewa {
  final BigInt id;
  final BigInt id_barang;
  final BigInt id_penyewa;
  final int durasi_sewa;
  final int jumlah_sewa;
  final int total_harga;
  final String status;
  final Barang barang;

  Sewa(
      {required this.id,
      required this.id_barang,
      required this.id_penyewa,
      required this.durasi_sewa,
      required this.jumlah_sewa,
      required this.total_harga,
      required this.status,
      required this.barang});

  factory Sewa.fromJson(Map<String, dynamic> json) {
    return Sewa(
        id: BigInt.from(json['id'] ?? 0),
        id_barang: BigInt.from(json['id_barang'] ?? 0),
        id_penyewa: BigInt.from(json['id_penyewa'] ?? 0),
        durasi_sewa: json['durasi_sewa'] as int? ?? 0,
        jumlah_sewa: json['durasi_sewa'] as int? ?? 0,
        total_harga: json['durasi_sewa'] as int? ?? 0,
        status: json['status'] ?? '',
        barang: Barang.fromJson(json['barang'] ?? {}));
  }
}
