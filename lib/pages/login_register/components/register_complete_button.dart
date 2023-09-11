import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/net/api.dart';
import '../../../model/Register.dart';
import '../../../res/colors.dart';
import '../../user_page/user_page.dart';

class RegisterCompleteButton extends StatefulWidget {
  final String username;
  final String password;
  final String email;

  const RegisterCompleteButton({
    Key? key, required this.username, required this.password, required this.email,

  }) : super(key: key);

  @override
  State<RegisterCompleteButton> createState() => _RegisterCompleteButtonState();
}

class _RegisterCompleteButtonState extends State<RegisterCompleteButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 40,
        width: 240,
        child: ElevatedButton(
          onPressed: ()  async{
            // final registerApi = RegisterApi();
            // Response response = await registerApi.register(
            //   widget.dpname,
            //   widget.username,
            //   widget.password,
            //   widget.linkman,
            //   widget.telephone,
            //   widget.useremail,
            //   widget.location,
            //   widget.verifyCode,
            // );
            // var msg=Register.fromJson(jsonDecode(response.toString())).msg;
            // if (msg=='注册成功'&&widget.password==widget.password2) {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (BuildContext context) {
            //         return UserPage();
            //       }));
            //
            // } else {
            //   if(widget.password!=widget.password2){
            //       Fluttertoast.showToast(
            //       msg: "※密码不一致请重新输入",
            //       toastLength: Toast.LENGTH_SHORT,
            //       gravity: ToastGravity.TOP,
            //       timeInSecForIosWeb: 1,
            //       backgroundColor: Color.fromARGB(255, 199, 199, 203),
            //       textColor: Color.fromARGB(255, 202, 5, 5),
            //       fontSize: 14.0);
            //   }else if(msg!='注册成功'){
            //     Fluttertoast.showToast(
            //         msg: msg,
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.TOP,
            //         timeInSecForIosWeb: 1,
            //         backgroundColor: Color.fromARGB(255, 199, 199, 203),
            //         textColor: Color.fromARGB(255, 202, 5, 5),
            //         fontSize: 14.0);
            //   }
            //
            //   }
            final registerApi = RegisterTest();
            Response response = await registerApi.register(
              widget.username,
              widget.password,
              widget.email,
            );
            var code=Register.fromJson(jsonDecode(response.toString())).code;
            if (code=='200') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return UserPage();
                  }));

            } else {
              if(code!='200'){
                Fluttertoast.showToast(
                    msg: code,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 199, 199, 203),
                    textColor: Color.fromARGB(255, 202, 5, 5),
                    fontSize: 14.0);
              }
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colours.loginButton),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29)))),
          child: Text(
            '完成注册并登录',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
