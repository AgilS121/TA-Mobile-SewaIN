import 'package:flutter/material.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/page/updateTambahBarang/update_tambah_barang.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

class BarangSewa extends StatefulWidget {
  const BarangSewa({super.key});

  @override
  State<BarangSewa> createState() => _BarangSewaState();
}

class _BarangSewaState extends State<BarangSewa> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  List<Barang> barang = [];
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
      // body: body(),
    );
  }

  // body() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Expanded(
  //           child: ListView.builder(
  //             itemCount: barang.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               if (barang[index].status != 'Selesai') {
  //                 return Column(
  //                   crossAxisAlignment: CrossAxisAlignment.stretch,
  //                   children: [
  //                     Container(
  //                       width: 355,
  //                       height: 90,
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(10),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey.withOpacity(0.5),
  //                             spreadRadius: 2,
  //                             blurRadius: 5,
  //                             offset: Offset(0, 3),
  //                           ),
  //                         ],
  //                       ),
  //                       child: Padding(
  //                         padding: EdgeInsets.symmetric(vertical: 8),
  //                         child: ListTile(
  //                           leading: Image.network(
  //                             barang[index].gambar,
  //                             width: 94,
  //                             height: 94,
  //                             fit: BoxFit.cover,
  //                           ),
  //                           title: Text(barang[index].namaBarang),
  //                           subtitle: Column(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 barang[index].namaToko,
  //                                 style: TextStyle(
  //                                   fontSize: 10,
  //                                   fontWeight: FontWeight.w700,
  //                                 ),
  //                               ),
  //                               Text(
  //                                 barang[index].kategori,
  //                                 style: TextStyle(
  //                                   fontSize: 9,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height: 5,
  //                               ),
  //                               Text(
  //                                 formatCurrency
  //                                     .format(barang[index].hargaBarang),
  //                                 style: TextStyle(
  //                                     fontSize: 10,
  //                                     fontWeight: FontWeight.w600,
  //                                     color: MyColors.bg),
  //                               ),
  //                             ],
  //                           ),
  //                           trailing: GestureDetector(
  //                             child: Icon(Icons.drag_handle),
  //                             onTapDown: (details) {
  //                               showMenu(
  //                                 context: context,
  //                                 position: RelativeRect.fromLTRB(
  //                                   details.globalPosition.dx,
  //                                   details.globalPosition.dy,
  //                                   0,
  //                                   0,
  //                                 ),
  //                                 items: [
  //                                   PopupMenuItem(
  //                                     child: Row(
  //                                       children: [
  //                                         Icon(Icons.edit, color: Colors.blue),
  //                                         SizedBox(width: 5),
  //                                         Text('Edit',
  //                                             style: TextStyle(
  //                                                 color: Colors.blue)),
  //                                       ],
  //                                     ),
  //                                     onTap: () {
  //                                       // Tambahkan kode untuk aksi edit barang
  //                                       Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (context) =>
  //                                                   updatetambahBarang()));
  //                                     },
  //                                   ),
  //                                   PopupMenuItem(
  //                                     child: Row(
  //                                       children: [
  //                                         Icon(Icons.delete, color: Colors.red),
  //                                         SizedBox(width: 5),
  //                                         Text('Delete',
  //                                             style:
  //                                                 TextStyle(color: Colors.red)),
  //                                       ],
  //                                     ),
  //                                     onTap: () {
  //                                       // Tambahkan kode untuk aksi hapus barang
  //                                     },
  //                                   ),
  //                                 ],
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 20,
  //                     )
  //                   ],
  //                 );
  //               } else {
  //                 return SizedBox.shrink();
  //               }
  //             },
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.bottomRight,
  //           child: FloatingActionButton(
  //             onPressed: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => updatetambahBarang()));
  //             },
  //             child: Icon(Icons.add),
  //             backgroundColor: MyColors.bg,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
