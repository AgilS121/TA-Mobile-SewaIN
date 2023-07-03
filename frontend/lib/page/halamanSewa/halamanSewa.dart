import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/root.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/addSewaService.dart';
import 'package:frontend/controllers/services/homeService.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/Pembayaran/pembayaran.dart';
import 'package:frontend/page/halamanSewa/components/durasi_sewa.dart';
import 'package:frontend/page/halamanSewa/components/image_halaman_sewa.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HalamanSewa extends StatefulWidget {
  final String accessToken;
  final String status;
  final Map listbarang;
  const HalamanSewa(
      {Key? key,
      required this.listbarang,
      required this.accessToken,
      required this.status});

  @override
  State<HalamanSewa> createState() => _HalamanSewaState();
}

class _HalamanSewaState extends State<HalamanSewa> {
  final durasiSewaKey = GlobalKey<DurasiSewaPageState>();
  double totalbayar = 0;

  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  int id = 0;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final url = Constans.apiUrl + '/me';
    final tokenManager = TokenManager();
    tokenManager.accessToken = widget.accessToken;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    print('ini response: ${response.statusCode} || ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = data['data'];
      setState(() {
        id = user['user']['id'];
      });
      print('ini data $data || ${user['user']['name']}');
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  int _selectedDuration = 1;

  void handleDurationSelected(int duration) {
    setState(() {
      _selectedDuration = duration;
    });
  }

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
                                    accessToken: widget.accessToken,
                                    status: widget.status,
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

  Widget body() {
    print('selectedDuration : $_selectedDuration');
    // print('coba ${widget.barang}');
    // BigInt dataid = HomeService.barang.;
    //         print('$dataid');
    print("ini durasi : ${widget.listbarang['durasi_sewa']}");
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
                  ImageHalamanSewa(image: widget.listbarang['image']),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.listbarang['nama_barang'],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
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
                            width: 10,
                          ),
                          Text(
                            widget.listbarang['nama_toko'],
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Hubungi",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.bg),
                        ),
                      )
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
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  widget.listbarang['deskripsi'],
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
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
              child: DurasiSewaPage(
                durasi_sewa: [widget.listbarang['durasi_sewa']],
                onChanged: handleDurationSelected,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget showBottomSewa() {
    print('ini id user $id');
    int idbarang = widget.listbarang['id'].toInt();
    String idbarangstring = idbarang.toString();
    int hargatotal = widget.listbarang['harga'] * _selectedDuration;
    print("ini total bayar ${totalbayar.toStringAsFixed(2)}");
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
                    hargatotal.toStringAsFixed(2),
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
                    onPressed: () {
                      SewaService.sewa(
                          context,
                          idbarangstring,
                          id.toString(),
                          _selectedDuration.toString(),
                          hargatotal.toString(),
                          widget.accessToken);
                    },
                    child: Text(
                      "Sewa",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
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
