import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/halamanSewa/halamanSewa.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  List<Barang> barang = [];

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Constans.apiUrl + '/barang';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        barang = (data['data'] as List)
            .map((item) => Barang.fromJson(item))
            .toList();
      });
    } else {
      // Gagal mengambil data, lakukan penanganan kesalahan
      print('Gagal mengambil data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: MyColors.bghome,
        child: ListView.builder(
          itemCount: barang.length,
          itemBuilder: (BuildContext context, int index) {
            String tampungImage = barang[index].image;
            print('$tampungImage');
            return Card(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.network(
                  // 'https://sewain13.000webhostapp.com/images/VNieEctyqZ4zV1DWOOBkb6gEXTFVKk.png',
                  'https://sewain13.000webhostapp.com/images/' + tampungImage,
                  width: 46,
                  height: 46,
                  fit: BoxFit.cover,
                ),
                title: Text(barang[index].nama_barang),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barang[index].deskripsi,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      barang[index].kategori.nama_kategori,
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      formatCurrency.format(barang[index].harga),
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // action on press

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HalamanSewa()));
                  },
                  child: Text("Sewa"),
                ),
              ),
            ));
          },
        ));
    ;
  }
}
