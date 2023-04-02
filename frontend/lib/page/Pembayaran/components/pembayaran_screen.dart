import 'package:flutter/material.dart';
import 'package:frontend/theme/pallete.dart';

class PembayaranScreen extends StatefulWidget {
  const PembayaranScreen({super.key});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  int _paymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.bghome,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
              Card(
                elevation: _paymentMethod == 0 ? 10.0 : 2.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _paymentMethod = 0;
                      });
                    },
                    leading: Image.asset("assets/images/Logo Duit.png"),
                    trailing: Radio(
                      value: 0,
                      groupValue: _paymentMethod,
                      onChanged: (int? value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    title: Text(
                      'Cash',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: _paymentMethod == 1 ? 10.0 : 2.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _paymentMethod = 1;
                      });
                    },
                    leading: Image.asset("assets/images/icon.png"),
                    trailing: Radio(
                      value: 1,
                      groupValue: _paymentMethod,
                      onChanged: (int? value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    title: Text(
                      'Gopay',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: _paymentMethod == 2 ? 10.0 : 2.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _paymentMethod = 2;
                      });
                    },
                    leading: Image.asset(
                        "assets/images/XPI515iaUKF1NBUI3sH83cylvtJuiznF2Mvtkd88.png"),
                    trailing: Radio(
                      value: 2,
                      groupValue: _paymentMethod,
                      onChanged: (int? value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    title: Text(
                      'Dana',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: _paymentMethod == 3 ? 10.0 : 2.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _paymentMethod = 3;
                      });
                    },
                    leading: Image.asset("assets/images/Group 4.png"),
                    trailing: Radio(
                      value: 3,
                      groupValue: _paymentMethod,
                      onChanged: (int? value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    title: Text(
                      'Transfer Bank',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ]),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                // implement your action here
              },
              child: Text('Bayar',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}
