import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {

  const BottomBarItem(this.icon, this.title, {super.key, 
    this.onTap, this.color = const Color(0xFF3E4249),
    this.activeColor = const Color(0xFFFF7D31),
    this.isActive = false,
    this.isNotified = false
  });

  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isActive;
  final bool isNotified;
  final GestureTapCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isNotified ? 
          new Stack(
            children: [
              new Icon(icon, size: 26, color: isActive ? activeColor : color,),
              new Positioned(
                top: 5.0,
                right: 0,
                left: 8.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: new Icon(
                    Icons.brightness_1, size: 10.0,  color: Colors.red,
                  ),
                ),
              )
            ],
          )
          :
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white.withOpacity(.15) : Colors.transparent,
            ),
            child: Icon(icon, size: 26, color: isActive ? activeColor : color,),
          )
        ],
      ),
    );
  }
}