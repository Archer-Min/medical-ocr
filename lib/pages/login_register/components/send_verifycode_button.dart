import 'package:flutter/material.dart';
import 'package:medical_retrieval/res/colors.dart';

import '../../../res/sever_url.dart';

class SendVerifyCodeButton extends StatefulWidget {
  const SendVerifyCodeButton({Key? key}) : super(key: key);

  @override
  State<SendVerifyCodeButton> createState() => _SendVerifyCodeButtonState();
}

class _SendVerifyCodeButtonState extends State<SendVerifyCodeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 38,
        width: 110,
        child: GestureDetector(
            onTap: () {
              setState(() {
                _loadVerfyCodeP();
              });
            },
            child: _loadVerfyCodeP()
            // Text(
            //   '获取验证码',
            //   style: TextStyle(color: Colors.white,fontSize: 13),
            // ),
          ),
      ),
      );
  }

  Widget _loadVerfyCodeP() =>Image.network('${SeverUrl.BASE_URL}/common/kaptcha',);
}


