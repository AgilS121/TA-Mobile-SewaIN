import 'package:flutter/material.dart';
import 'package:frontend/pallete/pallete.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    // SingleChildScrollView(
      
    //   // Column(
    //     child:
         Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    child: Container(
                      // width: 317,
                      // height: 317,
                      padding: EdgeInsets.only(top: 110, left: 38, right: 38, bottom: 56),
                      child: Image.asset("assets/images/login.png"),
                    ),
                  ),
                ),
                
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
              height: 462,
              // width: 393,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                      Text(
                        "SELAMAT DATANG!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            label: Text("E-Mail"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                            "Lupa Password?",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                          ],
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                              )
                            ),
                            width: 355,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Masuk"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(MyColors.bg),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum memili account ?"
                            ),
                            Text(
                              "Daftar",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            )
                          ],
                        )
                    ],
                ),
                  ),
            )
          ],
        
      // ),
      
    );
  }
}