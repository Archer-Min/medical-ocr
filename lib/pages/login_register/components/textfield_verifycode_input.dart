import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/components/textfiled_container.dart';
import 'package:medical_retrieval/res/colors.dart';

class RoundedVerifyCode extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String> ?onChanged;
  const RoundedVerifyCode({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: 120,
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colours.app_main,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}