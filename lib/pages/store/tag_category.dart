import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';

class Tag extends StatefulWidget {
  const Tag({
    super.key,
    required this.index
  });

  final int index;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: Constant.width,
    //   height: 40,
    //   decoration: BoxDecoration(
    //       color: Colours.app_main, borderRadius: BorderRadius.circular(8.0)),
    //   child: Padding(
    //     padding: const EdgeInsets.all(6.0),
    //     child: Text(Constant.category[widget.index],style: TextStyle(color: Colours.material_bg,fontSize: 15),)
    //     ),
    //   );
    return Container(
      width: Constant.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(onTap:(){},child: Icon(Icons.arrow_back_ios_new,color: Colours.tagFontColor,)),
              Icon(Icons.folder,color: Colours.tagFontColor,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Constant.category[widget.index],style: TextStyle(color: Colours.tagFontColor,fontSize: Constant.tagFontSize)),
              ),
            ],
          ),
          Container(height: 4,width: 220-(Constant.category[widget.index].length-2).toDouble()*18,decoration: BoxDecoration(color: Colours.tagColor,borderRadius: BorderRadius.circular(16)),)
        ],
      ),
    );
  }
}
