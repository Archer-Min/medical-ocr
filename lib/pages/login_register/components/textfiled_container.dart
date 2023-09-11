import 'package:flutter/material.dart';

import '../../../res/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double width;
  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 38,
      width: width,
      decoration: BoxDecoration(
        color: Colours.material_bg,
        borderRadius: BorderRadius.circular(29),
        boxShadow: [BoxShadow(
          color: Color(0x380A298B),
          blurRadius: 6,
          spreadRadius: 0.5
        )]
      ),
      child: child,
    );
  }
}
