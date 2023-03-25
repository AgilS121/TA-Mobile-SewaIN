import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/theme/pallete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: MyColors.bghome,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 5,
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      "assets/images/Mask group.png",
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: 26,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rental PS 2",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Tukang Rental",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Hiburan",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Harga",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        // action on press
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 0, right: 0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Sewa"),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
