import 'package:flutter/material.dart';

class Barang {
  final int id;
  final String namaBarang;
  final String descripsiBarang;
  final String status;
  final int hargaBarang;
  final String gambar;
  late String namaToko;
  final String kategori;

  Barang({
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

List<Barang> barang = [
  Barang(
      id: 1,
      namaBarang: "Kamera sony A3",
      descripsiBarang: "Kamera dengan merek sony",
      status: "Menunggu Konfirmasi",
      hargaBarang: 7000000,
      gambar: 'https://picsum.photos/200/300/?blur=2',
      namaToko: 'Sony',
      kategori: 'Elektronik'),
  Barang(
      id: 2,
      namaBarang: "Lensa Sigma",
      descripsiBarang: "Lensa dari sigma",
      status: "Terkonfirmasi",
      hargaBarang: 2400000,
      gambar: 'https://picsum.photos/seed/picsum/200/300',
      namaToko: 'Sigma',
      kategori: 'Lensa'),
  Barang(
      id: 3,
      namaBarang: "Lensa Sigma 2",
      descripsiBarang: "Lensa dari sigma",
      status: "Selesai",
      hargaBarang: 2400000,
      gambar: 'https://picsum.photos/seed/picsum/200/300',
      namaToko: 'Sigma',
      kategori: 'Lensa')
];
