import 'package:flutter/material.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/theme/pallete.dart';

class RiwayatPeminjaman extends StatefulWidget {
  const RiwayatPeminjaman({super.key});

  @override
  State<RiwayatPeminjaman> createState() => _RiwayatPeminjamanState();
}

class _RiwayatPeminjamanState extends State<RiwayatPeminjaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bghome,
      appBar: AppBar(
        backgroundColor: MyColors.bottombar,
        elevation: 16,
        shadowColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Icon(color: MyColors.bg, Icons.arrow_back),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Keranjang Sewa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  )
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
      itemCount: barang.length,
      itemBuilder: (BuildContext context, int index) {
        if (barang[index].status == 'Selesai') {
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "durasi sewa",
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: MyColors.bg),
                  )
                ],
              ),
              trailing: Text(
                barang[index].status,
                style: TextStyle(
                    color: MyColors.text,
                    fontWeight: FontWeight.w600,
                    fontSize: 8),
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
