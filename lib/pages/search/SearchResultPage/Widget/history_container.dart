import 'package:flutter/material.dart';

import '../../../../res/colors.dart';
import '../../../../res/constant.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({Key? key, required this.history, required this.date}) : super(key: key);

  final String history;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 31,
        width: Constant.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colours.material_bg
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(history,style: TextStyle(
                color: Colours.authorColor,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(date,style: TextStyle(
                color: Colours.authorColor,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
