import 'package:flutter/material.dart';
import 'package:frontend/components/item_bottombar.dart';
import 'package:frontend/page/home/home.dart';
import 'package:frontend/theme/pallete.dart';

class Root extends StatefulWidget {
  const Root({super.key});

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

  List<Widget> pages = [
    HomePage(), HomePage(), HomePage(), HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return toHome();
  }

  toHome(){
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
            color: Colors.black87.withOpacity(0.1),
            blurRadius: .5,
            spreadRadius: .5,
            offset: Offset(0, 1)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
          List.generate(
            icons.length,
            (index) => BottomBarItem(
              icons[index], " ", isActive : activeTab == index,
              activeColor: Color(0xFFFF7D31),
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              }
            )
          )
        
      ),
    );
  }

  Widget BarPage(){
    return IndexedStack(
      index: activeTab,
      children: 
        List.generate(icons.length, (index) => pages[index]),
    );
  }

}