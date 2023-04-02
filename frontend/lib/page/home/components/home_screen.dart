import 'package:flutter/material.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/halamanSewa/halamanSewa.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: MyColors.bghome,
        child: ListView.builder(
          itemCount: barang.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.network(
                  barang[index].gambar,
                  width: 46,
                  height: 46,
                  fit: BoxFit.cover,
                ),
                title: Text(barang[index].namaBarang),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barang[index].descripsiBarang,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      barang[index].kategori,
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      formatCurrency.format(barang[index].hargaBarang),
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
