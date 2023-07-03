import 'package:flutter/material.dart';
import 'package:frontend/page/Pembayaran/components/pembayaran_image_screen.dart';
import 'package:frontend/page/Pembayaran/components/pembayaran_screen.dart';
import 'package:frontend/theme/pallete.dart';

class Pembayaran extends StatefulWidget {
  final String accessToken;
  final Map databarang;
  final Map datasewa;
  const Pembayaran({
    Key? key,
    required this.accessToken,
    required this.databarang,
    required this.datasewa,
  }) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    // print("ini data dari halaman sewa ${widget.databarang['id']}");
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: AppBar(
        backgroundColor: MyColors.bg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pilih Metode Pembayaran",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    print('ini total harga ${widget.databarang['harga_total']}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: PembayaranImageScreen(),
        ),
        Flexible(
          flex: 2,
          child: PembayaranScreen(
            accessToken: widget.accessToken,
            databarang: {
              "id": widget.databarang['id'],
              "name": widget.databarang['name'],
              "email": widget.databarang['email'],
              "nama_barang": widget.databarang['nama_barang'],
              "harga_total": widget.databarang['harga_total'],
            },
          ),
        ),
      ],
    );
  }
}
