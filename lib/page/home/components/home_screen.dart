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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<List<Barang>> fetchData() async {
    try {
      final List<Barang> data = await HomeService.fetchBarang();
      return data;
    } catch (e) {
      print('Gagal mengambil data: $e');
      return [];
    }
  }

  Future<void> _refreshData() async {
    final data = await fetchData();
    setState(() {
      HomeService.barang = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.bghome,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Card(
                  color: Color.fromARGB(240, 243, 243, 243),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: HomeService.barang.length,
                          itemBuilder: (BuildContext context, int index) {
                            print("ini durrasi");
                            print(HomeService.barang[index].durasi_sewa);
                            String tampungImage =
                                HomeService.barang[index].image;
                            print('$tampungImage');
                            BigInt dataid = HomeService.barang[index].id;
                            print('$dataid');
                            return Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  leading: Image.network(
                                    Constans.imageUrl + tampungImage,
                                    width: 46,
                                    height: 46,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    HomeService.barang[index].nama_barang,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        HomeService.barang[index].deskripsi,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        HomeService.barang[index].kategori
                                            .nama_kategori,
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        formatCurrency.format(
                                            HomeService.barang[index].harga),
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
                                    onPressed: () async {
                                      final barang =
                                          await HomeService.fetchDetailBarang(
                                              dataid);
                                      print('Ini barang: $barang');
                                      try {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HalamanSewa(
                                              listbarang: {
                                                "id": HomeService
                                                    .barang[index].id,
                                                "nama_barang": HomeService
                                                    .barang[index].nama_barang,
                                                "deskripsi": HomeService
                                                    .barang[index].deskripsi,
                                                "durasi_sewa": HomeService
                                                    .barang[index].durasi_sewa,
                                                "image": HomeService
                                                    .barang[index].image,
                                                "nama_toko": HomeService
                                                    .barang[index]
                                                    .member
                                                    .nama_tempat,
                                                "harga": HomeService
                                                    .barang[index].harga,
                                              },
                                              accessToken: widget.accessToken,
                                              status: widget.status,
                                            ),
                                          ),
                                        );
                                      } catch (e) {
                                        // Tangani kesalahan
                                        print('Error: $e');
                                      }
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
                                          MaterialStateProperty.all(
                                              MyColors.bg),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
