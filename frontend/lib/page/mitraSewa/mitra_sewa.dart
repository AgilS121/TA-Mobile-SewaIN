import 'package:flutter/material.dart';
import 'package:frontend/page/barangSewa/barang_sewa.dart';
import 'package:frontend/page/daftarBarangPinjam/daftar_barang_pinjam.dart';
import 'package:frontend/theme/pallete.dart';

class MitraSewa extends StatefulWidget {
  final String accesstoken;
  const MitraSewa({super.key, required this.accesstoken});

  @override
  State<MitraSewa> createState() => _MitraSewaState();
}

class _MitraSewaState extends State<MitraSewa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bghome,
      appBar: AppBar(
          backgroundColor: MyColors.bottombar,
          elevation: 16,
          shadowColor: Color.fromARGB(0, 41, 41, 41).withOpacity(0.2),
          iconTheme: IconThemeData(color: MyColors.bg),
          title: Text(
            "Mitra Sewa.in",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins'),
          )),
      body: body(),
    );
  }

  body() {
    return Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BarangSewa(
                              accesstoken: widget.accesstoken,
                            )));
              },
              child: Container(
                  width: 355,
                  height: 150,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                        "assets/images/Group 7.png",
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Barang Sewa",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 23,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DaftarBarangPinjam()));
              },
              child: Container(
                  width: 355,
                  height: 150,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/images/Group 8.png",
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Daftar Barang Dipinjam",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
