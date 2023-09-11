import 'package:flutter/material.dart';
import 'package:medical_retrieval/res/myicons.dart';

import '../res/colors.dart';

class TheTabBar extends StatelessWidget {
  const TheTabBar({
    super.key,
    this.tabBarColor=Colours.app_main,
    this.tabBarheight=50,
  });

  final Color? tabBarColor;
  final double tabBarheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tabBarheight,
      decoration: BoxDecoration(
          color: tabBarColor
      ),
      child: TabBar(
        tabs: [
          Tab(icon: Icon(MyFont.home,size: 30,)),
          Tab(icon: Icon(MyFont.store,size: 30,)),
          Tab(icon: Icon(Icons.person,size: 30,)),
        ],
      ),
    );
  }
}
