import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/components/textfiled_container.dart';
import 'package:medical_retrieval/res/colors.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String> ?onChanged;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

 // final TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: 240,
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colours.app_main,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            //color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}