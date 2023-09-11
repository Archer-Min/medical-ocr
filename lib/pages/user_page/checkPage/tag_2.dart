import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/constant.dart';


class Tag2 extends StatefulWidget {
  const Tag2({
    super.key,
    required this.index
  });

  final int index;

  @override
  State<Tag2> createState() => _Tag2State();
}

class _Tag2State extends State<Tag2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constant.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(onTap:(){},child: Icon(Icons.arrow_back_ios_new,color: Colours.tagFontColor,)),
              Icon(Constant.userInfomIcons[widget.index],color: Colours.tagFontColor,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Constant.userInform[widget.index],style: TextStyle(color: Colours.tagFontColor,fontSize: Constant.tagFontSize)),
              ),
            ],
          ),
          Container(height: 4,width: 220-(Constant.userInform[widget.index].length-2).toDouble()*18,decoration: BoxDecoration(color: Colours.tagColor,borderRadius: BorderRadius.circular(16)),)
        ],
      ),
    );
  }
}
