import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/constant.dart';

class SelectBar extends StatefulWidget {
  const SelectBar({Key? key}) : super(key: key);

  @override
  State<SelectBar> createState() => _SelectBarState();
}

class _SelectBarState extends State<SelectBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constant.width,
      decoration: BoxDecoration(
          color: Colours.app_main, borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Wrap(
          spacing: 2,
          runSpacing: 1,
          children: classification(),
        ),
      ),
    );
  }
}

List<Widget> classification() =>
    List.generate(Constant.category.length, (index) {
      return Container(
        height: 28,
        child: GestureDetector(
          child: Text(
            Constant.category[index]+' | ',
            style: TextStyle(
              color: Colours.material_bg,
            ),
          ),
          onTap: () {

          },
        ),
      );
    });
