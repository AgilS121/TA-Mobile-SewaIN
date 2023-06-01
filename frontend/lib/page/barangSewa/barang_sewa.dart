import 'package:flutter/material.dart';
import 'package:frontend/components/button_melayang.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/dataBarangMember.dart';
import 'package:frontend/controllers/services/deleteBarangMember.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/updateTambahBarang/editBarang.dart';
import 'package:frontend/page/updateTambahBarang/tambahBarang.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

class BarangSewa extends StatefulWidget {
  final String accesstoken;
  const BarangSewa({Key? key, required this.accesstoken});

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
        shadowColor: Color.fromARGB(0, 41, 41, 41).withOpacity(0.2),
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
                                BarangMemberService.barangmember[index].image,
                            width: 94,
                            height: 94,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            BarangMemberService.barangmember[index].nama_barang,
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
                                BarangMemberService
                                    .barangmember[index].member.nama_tempat,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                BarangMemberService
                                    .barangmember[index].kategori.nama_kategori,
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
                                formatCurrency.format(BarangMemberService
                                    .barangmember[index].harga),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
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
                                    padding: EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditBarang(
                                                accessToken: widget.accesstoken,
                                                listbarang: {
                                                  "id": BarangMemberService
                                                      .barangmember[index].id,
                                                  "nama_barang":
                                                      BarangMemberService
                                                          .barangmember[index]
                                                          .nama_barang,
                                                  "deskripsi":
                                                      BarangMemberService
                                                          .barangmember[index]
                                                          .deskripsi,
                                                  "durasi_sewa":
                                                      BarangMemberService
                                                          .barangmember[index]
                                                          .durasi_sewa,
                                                  "image": BarangMemberService
                                                      .barangmember[index]
                                                      .image,
                                                  "harga": BarangMemberService
                                                      .barangmember[index]
                                                      .harga,
                                                  "stok": BarangMemberService
                                                      .barangmember[index].stok,
                                                  "kategori":
                                                      BarangMemberService
                                                          .barangmember[index]
                                                          .id_kategori,
                                                  "subkategori":
                                                      BarangMemberService
                                                          .barangmember[index]
                                                          .id_subkategori,
                                                },
                                              ),
                                            ),
                                          );
                                          // print(
                                          //     'kategori ${BarangMemberService.barangmember[index].id_kategori}');
                                        },
                                        child: Icon(Icons.edit,
                                            color: Colors.blue),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                      padding: EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            showDeleteConfirmation(
                                                context,
                                                BarangMemberService
                                                    .barangmember[index].id
                                                    .toString());
                                          },
                                          child: Icon(Icons.delete,
                                              color: Colors.red),
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.red,
                                        ),
                                      )),
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

  void showDeleteConfirmation(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog konfirmasi
                DeleteBarangMember.deleteBarang(context, id,
                    widget.accesstoken); // Panggil fungsi deleteBarang
              },
              child: Text('Ya'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog konfirmasi
              },
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}
