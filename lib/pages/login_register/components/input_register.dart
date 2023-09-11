import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/components/textfiled_container.dart';

import '../../../res/colors.dart';

class InputTextfield extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? myHintText;
  final TextEditingController? myController;
  final String inform;
  final bool hide;

  const InputTextfield(
      {Key? key, required this.onChanged, this.myHintText, this.myController, required this.inform, required this.hide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 70,),
            Container(
              height: 16,
              width: 5,
              decoration: BoxDecoration(
                color: Colours.app_main
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(this.inform,style: TextStyle(color: Colours.app_main),),
            )
          ],
        ),
        TextFieldContainer(
          width: 240,
          child: TextFormField(
            controller: myController,
            onChanged: onChanged,
            cursorColor: Colours.app_main,
            obscureText: hide,
            decoration: InputDecoration(
              hintText: myHintText,

              // suffixIcon: Icon(
              //   Icons.visibility,
              //   color: kPrimaryColor,
              // ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
