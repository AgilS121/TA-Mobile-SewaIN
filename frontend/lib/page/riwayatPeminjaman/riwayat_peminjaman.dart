import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/dataSewaService.dart';
import 'package:frontend/models/barang.dart';
import 'package:frontend/models/sewas.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:intl/intl.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class RiwayatPeminjaman extends StatefulWidget {
  final String accessToken;
  const RiwayatPeminjaman({Key? key, required this.accessToken})
      : super(key: key);

  @override
  State<RiwayatPeminjaman> createState() => _RiwayatPeminjamanState();
}

class _RiwayatPeminjamanState extends State<RiwayatPeminjaman> {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> fetchData() async {
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

  Future<void> _refreshData() async {
    await fetchData();
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
                    Text(
                      "Riwayat Sewa",
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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refreshData,
        child: body(),
      ),
    );
  }

  body() {
    return ListView.builder(
      itemCount: DataSewa.sewa.length,
      itemBuilder: (BuildContext context, int index) {
        final DateTime createdAt = DataSewa.sewa[index].createdAt;
        final DateTime now = DateTime.now();
        final Duration durasiSewa = now.difference(createdAt);

        final int durasiHari = durasiSewa.inDays;
        final int durasiMenit = durasiSewa.inMinutes % 60;

        bool isCountdown = DataSewa.sewa[index].status == 'sudah';

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
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  isCountdown
                      ? CountdownTimer(
                          endTime: createdAt
                              .add(Duration(days: durasiHari))
                              .millisecondsSinceEpoch,
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: MyColors.bg,
                          ),
                          onEnd: () {
                            // Jika waktu sewa habis, lakukan sesuatu
                          },
                        )
                      : Text(
                          "Durasi sewa: $durasiHari hari $durasiMenit menit",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: MyColors.bg,
                          ),
                        ),
                ],
              ),
              trailing: Text(
                DataSewa.sewa[index].status,
                style: TextStyle(
                  color: MyColors.text,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
