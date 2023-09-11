import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/Widget/history_container.dart';
import 'package:medical_retrieval/widgets/my_textfield.dart';

import '../../../res/colors.dart';
import '../../../res/constant.dart';

class SimpleSearchPage extends StatelessWidget {
  const SimpleSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Constant.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
            child: Row(
              children: [
                GestureDetector(onTap:(){},child: Icon(Icons.arrow_back_ios_new,color: Colours.tagFontColor,)),
                MyTextField(width: 300,),
              ],
            ),
          ),
        ),
        HistoryContainer(history: '精神状态极佳', date: '2023.3.1'),
        HistoryContainer(history: '精神状态极佳', date: '2023.3.1'),
        HistoryContainer(history: '精神状态极佳', date: '2023.3.1'),
        HistoryContainer(history: '精神状态极佳', date: '2023.3.1'),
        HistoryContainer(history: '精神状态极佳', date: '2023.3.1')
      ],
    );
  }
}
