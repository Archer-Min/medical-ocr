import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/user_page/checkPage/InformRecordCard.dart';

import '../../../res/colors.dart';

class InformList extends StatefulWidget {
  const InformList({Key? key, required this.index,}) : super(key: key);

  final int index;
  @override
  State<InformList> createState() => _InformListState();
}

class _InformListState extends State<InformList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return InformCard[widget.index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 14,
        );
      },
    );
  }
}

List <Widget> InformCard=[
  Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',),
  Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',),
  Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',),
  Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',)
];
