import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/dataSewaService.dart';
import 'package:frontend/models/sewas.dart';
import 'package:frontend/page/Pembayaran/pembayaran.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';

class KeranjangSewa extends StatefulWidget {
  final String accessToken;
  const KeranjangSewa({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<KeranjangSewa> createState() => _KeranjangSewaState();
}

class _KeranjangSewaState extends State<KeranjangSewa> {
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
                    // Icon(Icons.arrow_back, color: MyColors.bg),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      "Keranjang Sewa",
                      style: TextStyle(
                        color: Colors.black,
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
    return ListView.builder(
      itemCount: DataSewa.sewa.length,
      itemBuilder: (BuildContext context, int index) {
        if (DataSewa.sewa[index].status != 'Selesai') {
          return Card(
            child: InkWell(
              onTap: () {
                if (DataSewa.sewa[index].status == 'Belum') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pembayaran(
                        accessToken: widget.accessToken,
                        datasewa: {
                          "id": DataSewa.sewa[index].id,
                          "id_barang": DataSewa.sewa[index].id_barang,
                          "id_penyewa": DataSewa.sewa[index].id_penyewa,
                          "durasi_sewa": DataSewa.sewa[index].durasi_sewa,
                          "jumlah_sewa": DataSewa.sewa[index].jumlah_sewa,
                          "harga_total": DataSewa.sewa[index].total_harga,
                          "status": DataSewa.sewa[index].status,
                          "name": DataSewa.sewa[index].barang.nama_barang,
                          "email": DataSewa.sewa[index].user.email
                        },
                        databarang: {
                          "id": DataSewa.sewa[index].id,
                          "id_barang": DataSewa.sewa[index].id_barang,
                          "id_penyewa": DataSewa.sewa[index].id_penyewa,
                          "durasi_sewa": DataSewa.sewa[index].durasi_sewa,
                          "jumlah_sewa": DataSewa.sewa[index].jumlah_sewa,
                          "harga_total": DataSewa.sewa[index].total_harga,
                          "status": DataSewa.sewa[index].status,
                          "name": DataSewa.sewa[index].barang.nama_barang,
                          "email": DataSewa.sewa[index].user.email
                        },
                      ),
                    ),
                  );
                  print(
                      'ini data ${DataSewa.sewa[index].user.email} || ${DataSewa.sewa[index].barang.nama_barang} || ${DataSewa.sewa[index].id} \n ${DataSewa.sewa[index].jumlah_sewa} \n ${DataSewa.sewa[index].total_harga}');
                }
              },
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "durasi sewa",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: MyColors.bg,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    DataSewa.sewa[index].status,
                    style: TextStyle(
                      color: DataSewa.sewa[index].status == 'Sudah'
                          ? Colors.green
                          : Colors.orange,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
