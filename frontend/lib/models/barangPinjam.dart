import 'package:flutter/material.dart';

class BarangPinjam {
  final int id;
  final String namaBarang;
  final String descripsiBarang;
  final String status;
  final int hargaBarang;
  final String gambar;
  late String namaToko;
  final String kategori;

  BarangPinjam({
    required this.id,
    required this.namaBarang,
    required this.descripsiBarang,
    required this.status,
    required this.hargaBarang,
    required this.gambar,
    required this.namaToko,
    required this.kategori,
  });
}

List<BarangPinjam> barangPinjam = [
  BarangPinjam(
      id: 1,
      namaBarang: "Kamera sony A3",
      descripsiBarang: "Kamera dengan merek sony",
      status: "Konfirmasi",
      hargaBarang: 7000000,
      gambar: 'https://picsum.photos/200/300/?blur=2',
      namaToko: 'Sony',
      kategori: 'Elektronik'),
  BarangPinjam(
      id: 2,
      namaBarang: "Lensa Sigma",
      descripsiBarang: "Lensa dari sigma",
      status: "Berlangsung",
      hargaBarang: 2400000,
      gambar: 'https://picsum.photos/seed/picsum/200/300',
      namaToko: 'Sigma',
      kategori: 'Lensa'),
  BarangPinjam(
      id: 3,
      namaBarang: "Lensa Sigma 2",
      descripsiBarang: "Lensa dari sigma",
      status: "Selesai",
      hargaBarang: 2400000,
      gambar: 'https://picsum.photos/seed/picsum/200/300',
      namaToko: 'Sigma',
      kategori: 'Lensa')
];
