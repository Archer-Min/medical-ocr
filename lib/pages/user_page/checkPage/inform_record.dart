import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/user_page/checkPage/inform_list.dart';
import 'package:medical_retrieval/pages/user_page/checkPage/tag_2.dart';

import '../../../res/colors.dart';
import '../../../res/constant.dart';

class InformRecordPage extends StatefulWidget {
  const InformRecordPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<InformRecordPage> createState() => _InformRecordPageState();
}

class _InformRecordPageState extends State<InformRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Tag2(
                index: widget.index,
              ),
              Container(
                  height:690,
                  width: Constant.width,
                  child: InformList(index: widget.index,))
            ],
          ),
        ),
      ),
    );
  }
}
