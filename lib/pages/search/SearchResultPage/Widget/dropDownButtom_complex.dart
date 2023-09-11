import 'package:flutter/material.dart';

import '../../../../res/colors.dart';
import '../../../../res/constant.dart';

///下拉选择框，需传入list选项，和第一个选项字符串
class MyDropDownButtom2 extends StatefulWidget {
  MyDropDownButtom2({Key? key,required this.list, required this.dropdownValue,this.location}) ;
  final List<String> list;
  String dropdownValue;
  int? location=1;

  @override
  State<MyDropDownButtom2> createState() => _MyDropDownButtom2State();
}


class _MyDropDownButtom2State extends State<MyDropDownButtom2> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height:16,
      decoration: BoxDecoration(
          color: Colours.selectButtonColor,
          borderRadius:widget.location ==1 ? BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)):BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16))
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
                  fontSize: Constant.selectFontSize-1,color: Colours.app_main
              ),));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
