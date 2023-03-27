import 'package:flutter/material.dart';
import 'package:frontend/components/body.dart';
import 'package:frontend/page/halamanSewa/components/image_halaman_sewa.dart';
import 'package:frontend/theme/pallete.dart';

class HalamanSewa extends StatefulWidget {
  const HalamanSewa({super.key});

  @override
  State<HalamanSewa> createState() => _HalamanSewaState();
}

class _HalamanSewaState extends State<HalamanSewa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(color: MyColors.bg, Icons.arrow_back),
              ),
            )
          ],
        ),
      ),
      body: body(),
    );
  }

  body() {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: ImageHalamanSewa(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
