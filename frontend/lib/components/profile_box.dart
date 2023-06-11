import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ProfileBox extends StatelessWidget {
  const ProfileBox({Key? key, this.number = 0, this.onTap}) : super(key: key);
  final int number;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.withOpacity(.3),),
        ),
        child: number > 0
            ? badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  padding: EdgeInsets.all(5),
                ),
                position: badges.BadgePosition.topEnd(top: -7, end: 2),
                badgeContent: Text('', 
                style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              )
            : Icon(
                Icons.person,
                size: 20,
              ),
      ),
    );
  }
}
