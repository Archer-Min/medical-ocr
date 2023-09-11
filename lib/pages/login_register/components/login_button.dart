
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:flutter/material.dart';

import '../../../common/net/api.dart';
import '../../../model/Login.dart';
import '../../../res/colors.dart';
import '../../user_page/user_page.dart';


class LoginButton extends StatefulWidget {
  final String id;
  final String password;
  final String verifyCode;

  const LoginButton({Key? key, required this.id, required this.password, required this.verifyCode,}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        height: 40,
        width: 240,
        child: ElevatedButton(
          onPressed: ()  async{
            final loginApi = LoginApi();
            Response response = await loginApi.login(
              widget.id,
              widget.password,
              widget.verifyCode,
            );
            var msg=Login.fromJson(jsonDecode(response.toString())).msg;
            if (msg=='登陆成功') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return UserPage();
                  }));
            }else if(msg!='登陆成功'){
              Fluttertoast.showToast(
                  msg: msg,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color.fromARGB(255, 199, 199, 203),
                  textColor: Color.fromARGB(255, 202, 5, 5),
                  fontSize: 14.0);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colours.loginButton),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29)
              ))
          ),
          child: Text(
            '登录',
            style: TextStyle(color: Colors.white,fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  _WebViewAppState createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebView"),
        ),
        body: Column(
          children: [
            this._flag ? _getMoreWidget() : Text(""),
            Expanded(
                child: InAppWebView(
                  //老版本：initialUrl    新版本：initialUrlRequest
                  initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          "https://docs.google.com/viewer?embedded=true&url=https://www.pdf995.com/samples/pdf.pdf")),
                  onProgressChanged: (controller, progress) {
                    if (progress / 100 > 0.9999) {
                      setState(() {
                        this._flag = false;
                      });
                    }
                  },
                ))
          ],
        ));
  }

  //自定义加载中的组件
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
