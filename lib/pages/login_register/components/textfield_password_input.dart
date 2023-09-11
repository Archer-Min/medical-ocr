import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/components/textfiled_container.dart';

import '../../../res/colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? myHintText;
  final TextEditingController? myController;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.myHintText,
    this.myController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: 240,
      child: TextField(
        controller: myController,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colours.app_main,
        decoration: InputDecoration(
          hintText: myHintText,
          hintStyle: TextStyle(fontSize: 14),
          icon: Icon(
            Icons.lock,
            //color: kPrimaryColor,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),

          border: InputBorder.none,
        ),
      ),
    );
  }
}