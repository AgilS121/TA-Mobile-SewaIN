import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/daftarBarangdipinjamservice.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/models/sewas.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';
import '../../models/barangPinjam.dart';

class DaftarBarangPinjam extends StatefulWidget {
  final String accesstoken;
  const DaftarBarangPinjam({super.key, required this.accesstoken});

  @override
  State<DaftarBarangPinjam> createState() => _DaftarBarangPinjamState();
}

class _DaftarBarangPinjamState extends State<DaftarBarangPinjam> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  void fetchData() async {
    try {
      final List<Sewa> data = await daftarBarangdipinjamservice
          .fetchBarangMember(widget.accesstoken);
      setState(() {
        daftarBarangdipinjamservice.sewamember = data;
      });
    } catch (e) {
      print("gagal mengambil data : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
    print('ini data barang pinjam member');
    print(daftarBarangdipinjamservice.sewamember);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: daftarBarangdipinjamservice.sewamember.length,
        itemBuilder: (BuildContext context, int index) {
          Color statusColor;
          switch (daftarBarangdipinjamservice.sewamember[index].status) {
            case 'Sudah':
              statusColor = Colors.grey;
              break;
            case 'Konfirmasi':
              statusColor = Colors.blue;
              break;
            case 'Selesai':
              statusColor = Colors.green;
              break;
            case 'Belum':
              statusColor = Colors.red;
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
                      Constans.imageUrl +
                          daftarBarangdipinjamservice
                              .sewamember[index].barang.image,
                      width: 94,
                      height: 94,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      'Nama Barang : ' +
                          daftarBarangdipinjamservice
                              .sewamember[index].barang.nama_barang,
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
                          'Penyewa : ' +
                              daftarBarangdipinjamservice
                                  .sewamember[index].user.name
                                  .toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Durasi : ' +
                              daftarBarangdipinjamservice
                                  .sewamember[index].durasi_sewa
                                  .toString() +
                              'hari',
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
                          'Harga : ' +
                              formatCurrency.format(daftarBarangdipinjamservice
                                  .sewamember[index].total_harga),
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          daftarBarangdipinjamservice.sewamember[index].status,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                            fontFamily: 'Poppins',
                          ),
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
