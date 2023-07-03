import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/homeService.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/halamanSewa/halamanSewa.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String accessToken;
  final String status;

  const HomeScreen({
    Key? key,
    required this.accessToken,
    required this.status,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  Future<List<Barang>> fetchData() async {
    try {
      final List<Barang> data = await HomeService.fetchBarang();
      return data;
    } catch (e) {
      print('Gagal mengambil data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Barang>>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<Barang>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Barang> data = snapshot.data ?? [];
          return RefreshIndicator(
            onRefresh: () async {
              await _refreshData();
            },
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final barang = data[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        Constans.imageUrl + barang.image,
                        width: 46,
                        height: 46,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        barang.nama_barang,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            barang.deskripsi,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            barang.kategori.nama_kategori,
                            style: TextStyle(
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            formatCurrency.format(barang.harga),
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: MyColors.bg,
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HalamanSewa(
                                listbarang: {
                                  "id": barang.id,
                                  "nama_barang": barang.nama_barang,
                                  "deskripsi": barang.deskripsi,
                                  "durasi_sewa": barang.durasi_sewa,
                                  "image": barang.image,
                                  "nama_toko": barang.member.nama_tempat,
                                  "harga": barang.harga,
                                },
                                accessToken: widget.accessToken,
                                status: widget.status,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Sewa",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.bg),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Future<void> _refreshData() async {
    final data = await fetchData();
    setState(() {
      HomeService.barang = data;
    });
  }
}
