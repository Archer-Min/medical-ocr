
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/register_page.dart';

import '../../../common/net/api.dart';
import '../../../res/colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 40,
        width: 240,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return RegisterPage();
            }));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colours.loginButton),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29)))),
          child: Text(
            '注册',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
