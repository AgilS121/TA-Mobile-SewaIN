import 'package:flutter/material.dart';
import 'package:frontend/theme/pallete.dart';

class PenyewaTwoScreen extends StatefulWidget {
  const PenyewaTwoScreen({super.key});

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
              TextFormField(
                controller: namaTempat,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("Nama Tempat"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg)),
                ),
              ),
              TextFormField(
                controller: Lokasi,
                decoration: InputDecoration(
                  label: Text("Lokasi"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg)),
                ),
              ),
              TextFormField(
                controller: noWA,
                decoration: InputDecoration(
                  label: Text("No WA"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.bg)),
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
                    onPressed: () {},
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
}
