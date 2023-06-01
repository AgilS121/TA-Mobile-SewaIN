import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/dataSewaService.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/models/sewas.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

class RiwayatPeminjaman extends StatefulWidget {
  final String accessToken;
  const RiwayatPeminjaman({super.key, required this.accessToken});

  @override
  State<RiwayatPeminjaman> createState() => _RiwayatPeminjamanState();
}

class _RiwayatPeminjamanState extends State<RiwayatPeminjaman> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  void fetchData() async {
    try {
      final List<Sewa> data = await DataSewa.fetchSewa(widget.accessToken);
      setState(() {
        DataSewa.sewa = data;
        print(DataSewa.sewa);
      });
    } catch (e) {
      print('Gagal mengambil data $e');
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
        backgroundColor: MyColors.bottombar,
        elevation: 16,
        shadowColor: Color.fromARGB(0, 41, 41, 41).withOpacity(0.2),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  // Icon(color: MyColors.bg, Icons.arrow_back),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text(
                    "Riwayat Sewa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
      body: body(),
    );
  }

  body() {
    return ListView.builder(
      itemCount: DataSewa.sewa.length,
      itemBuilder: (BuildContext context, int index) {
        if (DataSewa.sewa[index].status == 'Selesai') {
          return Card(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(
                Constans.imageUrl + DataSewa.sewa[index].barang.image,
                width: 46,
                height: 46,
                fit: BoxFit.cover,
              ),
              title: Text(
                DataSewa.sewa[index].barang.nama_barang,
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
                    DataSewa.sewa[index].barang.deskripsi,
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "durasi sewa",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: MyColors.bg),
                  ),
                ],
              ),
              trailing: Text(
                DataSewa.sewa[index].status,
                style: TextStyle(
                    color: MyColors.text,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
          ));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
