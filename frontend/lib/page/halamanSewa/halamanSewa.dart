import 'package:flutter/material.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/page/halamanSewa/components/durasi_sewa.dart';
import 'package:frontend/page/halamanSewa/components/image_halaman_sewa.dart';
import 'package:frontend/theme/pallete.dart';

class HalamanSewa extends StatefulWidget {
  const HalamanSewa({super.key});

  @override
  State<HalamanSewa> createState() => _HalamanSewaState();
}

class _HalamanSewaState extends State<HalamanSewa> {
  double totalbayar = 0;
  String title = "PS 3 + Dualshock 3";
  String namatoko = "Rental PS Juara";
  String isiDescripsi = "- tas\n- stik";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bghome,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    color: MyColors.bg,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Root(
                                    accessToken: '',
                                  )));
                    },
                  )),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  color: MyColors.bg,
                  Icons.shopping_bag_outlined,
                ),
              ),
            )
          ],
        ),
      ),
      body: body(),
      bottomSheet: showBottomSewa(),
    );
  }

  body() {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageHalamanSewa(),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "$title",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                                AssetImage("assets/images/default.png"),
                          ),
                          SizedBox(
                            width: 26,
                          ),
                          Text(
                            "$namatoko",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Hubungi"))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: MyColors.bghome,
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  "Deskripsi Barang",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "$isiDescripsi",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: MyColors.bghome,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 8),
              child: DurasiSewaPage(),
            ),
          ],
        ),
      ),
    ));
  }

  showBottomSewa() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2), // offset untuk membuat shadow di bagian atas
          ),
        ],
      ),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 19, bottom: 4, left: 20),
              child: Row(
                children: [
                  Text(
                    "Total Biaya Sewa : ",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Rp. $totalbayar",
                    style: TextStyle(
                        color: MyColors.bg,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  width: 351,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Sewa"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyColors.bg),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
