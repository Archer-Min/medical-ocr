import 'package:flutter/material.dart';

import '../../../model/HistoryRecord.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';

class Card1 extends StatefulWidget {
  const Card1({Key? key, required this.title, required this.author, required this.date, }) : super(key: key);
  final String title;
  final String author;
  final String date;

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1.3,right: 1.3,bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colours.material_bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0x1F1034A6),width: 0.6,),
            boxShadow: [BoxShadow(color: Color(0x381034A6),spreadRadius: 0.5,blurRadius: 1,offset: Offset(0.2,0.5))]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///标题
              GestureDetector(
                onTap: () {},
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colours.titleColor, fontSize: Constant.titleSize),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                widget.author,
                style: const TextStyle(color: Colours.authorColor,fontSize: Constant.authorSize),
              ),
              SizedBox(height: 4,),
              Text(
                widget.date,
                style: const TextStyle(color: Colours.authorColor,fontSize: Constant.authorSize),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
