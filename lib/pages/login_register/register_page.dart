import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/components/input_register.dart';
import 'package:medical_retrieval/pages/login_register/components/register_complete_button.dart';
import 'package:medical_retrieval/pages/login_register/components/textfiled_container.dart';
import 'package:medical_retrieval/res/colors.dart';
import 'package:medical_retrieval/res/constant.dart';

import 'components/send_verifycode_button.dart';
import 'components/textfield_verifycode_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                _inputList(),

            ),
          ),
        ),),
    );
  }

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController verifyController=TextEditingController();

  List<Widget> _inputList(){
    List<Widget> inputField=[];
    for (int i=0;i<Constant.registerInform.length;i++){
      inputField.add(
          InputTextfield(
            onChanged: (value) {
              setState(() {
                controllers[i].text=value;
              });
            },
            inform: Constant.registerInform[i],
            hide: i==2||i==3? true:false,
          )
      );
    }
    inputField.add(SizedBox(height: 8,));

    inputField.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedVerifyCode(
            hintText: '验证码',
            onChanged: (value) {
              setState(() {
                verifyController.text=value;
              });
            },
          ),
          SendVerifyCodeButton()
        ],
      ),
    );

    inputField.add( RegisterCompleteButton(
      //dpname: controllers[0].text,
      username: controllers[1].text,
      password: controllers[2].text,
      email: controllers[3].text,
      // password2: controllers[3].text,
      // linkman: controllers[4].text,
      // telephone: controllers[5].text,
      // useremail: controllers[6].text,
      // location: controllers[7].text,
      // verifyCode: verifyController.text,),
    ));

    inputField.add(SizedBox(height: 90,));

    return inputField;
  }
}

