import 'package:flutter/material.dart';
import 'package:frontend/page/mitraSewa/mitra_sewa.dart';
import 'package:frontend/theme/pallete.dart';

class PenyewaTwoScreen extends StatefulWidget {
  final String accesstoken;
  const PenyewaTwoScreen({super.key, required this.accesstoken});

  @override
  State<PenyewaTwoScreen> createState() => _PenyewaTwoScreenState();
}

class _PenyewaTwoScreenState extends State<PenyewaTwoScreen> {
  TextEditingController namaTempat = TextEditingController();
  TextEditingController Lokasi = TextEditingController();
  TextEditingController noWA = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Mari Bergabung !",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: namaTempat,
                decoration: InputDecoration(
                  labelText: 'Nama Tempat',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.bg),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.bg),
                  ),
                ),
              ),
              TextField(
                controller: Lokasi,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Lokasi',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.bg),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.bg),
                  ),
                ),
              ),
              TextField(
                controller: noWA,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'wa.me/628*********',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.bg),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.bg),
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  width: 355,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isValidForm()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MitraSewa(
                                      accesstoken: widget.accesstoken,
                                    )));
                      }
                    },
                    child: Text(
                      "Gabung",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyColors.bg),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  bool _isValidForm() {
    return namaTempat.text.isNotEmpty &&
        Lokasi.text.isNotEmpty &&
        noWA.text.isNotEmpty;
  }
}
