import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/register_page.dart';

import '../../res/colors.dart';
import 'components/login_button.dart';
import 'components/register_button.dart';
import 'components/send_verifycode_button.dart';
import 'components/textfield_name_input.dart';
import 'components/textfield_password_input.dart';
import 'components/textfield_verifycode_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var nameController=TextEditingController() ;
  var pswController=TextEditingController() ;
  TextEditingController verifyController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    String name='';
    String password='';
    String verifycode='';
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 94,
                width: 94,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.grey,
                    image: DecorationImage(image: AssetImage("assets/images/user.jpg"),fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 20),

              RoundedInputField(
                hintText: "用户名",
                onChanged: (value) {
                  setState((){
                    nameController.text=value;
                  });
                  print("username: " + value);
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState((){
                    pswController.text=value;
                  });
                  print("password: " + value);
                },
                myHintText: "密码",
              ),
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
              LoginButton(id: nameController.text,password: pswController.text, verifyCode: verifyController.text,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return RegisterPage();
                      }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('没账号？请点击注册',style: TextStyle(color: Colours.registerTextColor),),
                ),
              )
              // RoundedButton(
              //   text: "LOGIN",
              //   //登录
              //   press: () {
              //     //校验
              //     print("下面是Email校验");
              //     if(!isEmail(email)){
              //       Fluttertoast.showToast(
              //           msg: "请保证邮箱正确!",
              //           gravity: ToastGravity.CENTER,
              //           textColor: Colors.grey);
              //     }
              //     else if(password==null||password==""){
              //       Fluttertoast.showToast(
              //           msg: "密码不能为空!",
              //           gravity: ToastGravity.CENTER,
              //           textColor: Colors.grey);
              //     }
              //     else{
              //       print("try to Login");
              //       login(email, password, context);
              //     }
              //   },
              // ),
              // SizedBox(height: size.height * 0.03),
              // AlreadyHaveAnAccountCheck(
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return SignUpScreen();
              //         },
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
