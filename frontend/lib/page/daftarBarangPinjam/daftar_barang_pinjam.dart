import 'package:flutter/material.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

import '../../models/barangPinjam.dart';

class DaftarBarangPinjam extends StatefulWidget {
  const DaftarBarangPinjam({super.key});

  @override
  State<DaftarBarangPinjam> createState() => _DaftarBarangPinjamState();
}

class _DaftarBarangPinjamState extends State<DaftarBarangPinjam> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bghome,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.bg),
        title: Text(
          "Daftar Barang Dipinjam",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        shadowColor: Color.fromARGB(0, 41, 41, 41).withOpacity(0.2),
      ),
      body: body(),
    );
  }

  body() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: barangPinjam.length,
        itemBuilder: (BuildContext context, int index) {
          Color statusColor;
          switch (barangPinjam[index].status) {
            case 'Berlangsung':
              statusColor = Colors.grey;
              break;
            case 'Konfirmasi':
              statusColor = Colors.blue;
              break;
            case 'Selesai':
              statusColor = Colors.green;
              break;
            default:
              statusColor = Colors.white;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 355,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.network(
                      barangPinjam[index].gambar,
                      width: 94,
                      height: 94,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      barangPinjam[index].namaBarang,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          barangPinjam[index].namaToko,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          barangPinjam[index].kategori,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          formatCurrency
                              .format(barangPinjam[index].hargaBarang),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: MyColors.bg),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 63,
                      height: 17,
                      decoration: BoxDecoration(
                        color: statusColor,
                      ),
                      child: Center(
                        child: Text(
                          barangPinjam[index].status,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        },
      ),
    );
  }
}
