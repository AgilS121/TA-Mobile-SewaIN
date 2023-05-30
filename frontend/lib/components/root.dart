import 'package:flutter/material.dart';
import 'package:frontend/components/item_bottombar.dart';
import 'package:frontend/page/home/home.dart';
import 'package:frontend/page/keranjangSewa/keranjang_sewa.dart';
import 'package:frontend/page/mitraSewa/mitra_sewa.dart';
import 'package:frontend/page/riwayatPeminjaman/riwayat_peminjaman.dart';
import 'package:frontend/penyewa/penyewa.dart';
import 'package:frontend/theme/pallete.dart';

class Root extends StatefulWidget {
  final String accessToken;
  final String status;

  const Root({Key? key, required this.accessToken, required this.status})
      : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int activeTab = 0;
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.shopping_bag_outlined,
    Icons.receipt_long_outlined,
    Icons.badge_outlined,
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(
        accessToken: widget.accessToken,
        status: widget.status,
      ),
      KeranjangSewa(
        accessToken: widget.accessToken,
      ),
      RiwayatPeminjaman(
        accessToken: widget.accessToken,
      ),
      if (widget.status == 'members') MitraSewa() else Penyewa(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return toHome();
  }

  toHome() {
    return Scaffold(
      backgroundColor: MyColors.bg,
      bottomNavigationBar: BottomBar(),
      body: BarPage(),
    );
  }

  Widget BottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: MyColors.bottombar,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2), // offset untuk membuat shadow di bagian atas
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              icons.length,
              (index) => BottomBarItem(icons[index], " ",
                      isActive: activeTab == index,
                      activeColor: MyColors.bg, onTap: () {
                    setState(() {
                      activeTab = index;
                    });
                  }))),
    );
  }

  Widget BarPage() {
    return IndexedStack(
      index: activeTab,
      children: List.generate(icons.length, (index) => pages[index]),
    );
  }
}
