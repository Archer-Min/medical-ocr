import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/constant.dart';
///下拉选择框，需传入list选项，和第一个选项字符串
class MyDropDownButtom extends StatefulWidget {
  MyDropDownButtom({Key? key,required this.list, required this.dropdownValue}) ;
  final List<String> list;
  String dropdownValue;

  @override
  State<MyDropDownButtom> createState() => _MyDropDownButtomState();
}


class _MyDropDownButtomState extends State<MyDropDownButtom> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height:26,
      decoration: BoxDecoration(
          color: Colours.material_bg,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: widget.dropdownValue,
            onChanged: (String? newValue){
              setState(() {
                widget.dropdownValue=newValue!;
              });
            },
            items: widget.list.map<
                DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value, child: Text(value,style: TextStyle(
                  fontSize: Constant.selectFontSize,color: Colours.app_main
              ),));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
