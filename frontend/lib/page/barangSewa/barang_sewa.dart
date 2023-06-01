import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/dataBarangMember.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/updateTambahBarang/editBarang.dart';
import 'package:frontend/page/updateTambahBarang/tambahBarang.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

class BarangSewa extends StatefulWidget {
  final String accesstoken;
  const BarangSewa({super.key, required this.accesstoken});

  @override
  State<BarangSewa> createState() => _BarangSewaState();
}

class _BarangSewaState extends State<BarangSewa> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  void fetchData() async {
    try {
      final List<Barang> data =
          await BarangMemberService.fetchBarangMember(widget.accesstoken);
      setState(() {
        BarangMemberService.barangmember = data;
      });
    } catch (e) {
      print('gagal mengambil data : $e');
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
          "Barang Sewa",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black),
        ),
      ),
      body: body(),
    );
  }

  body() {
    print('sampai ke barangsewa member');
    print(BarangMemberService.barangmember);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: BarangMemberService.barangmember.length,
              itemBuilder: (BuildContext context, int index) {
                // if (barang[index].status != 'Selesai') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 355,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
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
                                BarangMemberService.barangmember[index].image,
                            width: 94,
                            height: 94,
                            fit: BoxFit.cover,
                          ),
                          title: Text(BarangMemberService
                              .barangmember[index].nama_barang),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                BarangMemberService
                                    .barangmember[index].member.nama_tempat,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                BarangMemberService
                                    .barangmember[index].kategori.nama_kategori,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                formatCurrency.format(BarangMemberService
                                    .barangmember[index].harga),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.bg),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            child: Icon(Icons.drag_handle),
                            onTapDown: (details) {
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  details.globalPosition.dx,
                                  details.globalPosition.dy,
                                  0,
                                  0,
                                ),
                                items: [
                                  PopupMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit, color: Colors.blue),
                                        SizedBox(width: 5),
                                        Text('Edit',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ],
                                    ),
                                    onTap: () {
                                      // Tambahkan kode untuk aksi edit barang
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditBarang()));
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete, color: Colors.red),
                                        SizedBox(width: 5),
                                        Text('Delete',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                    onTap: () {
                                      // Tambahkan kode untuk aksi hapus barang
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
                // } else {
                // return SizedBox.shrink();
                // }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TambahBarang(
                              accessToken: widget.accesstoken,
                            )));
              },
              child: Icon(Icons.add),
              backgroundColor: MyColors.bg,
            ),
          )
        ],
      ),
    );
  }
}
