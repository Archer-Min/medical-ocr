import 'package:flutter/material.dart';

import '../../../model/SearchAbs.dart';
import '../../../model/SearchDoc.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../searchResult/search_result_list.dart';

class ComplexSearchResultPage extends StatefulWidget {
  const ComplexSearchResultPage({Key? key, required this.result,required this.condition, required this.abs}) : super(key: key);
  final List<SearchDoc> result;
  final List<SearchAbs> abs;
  final String condition ;

  @override
  State<ComplexSearchResultPage> createState() => _ComplexSearchResultPageState();
}

class _ComplexSearchResultPageState extends State<ComplexSearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: Constant.width,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(onTap:(){},child: Icon(Icons.arrow_back_ios_new,color: Colours.tagFontColor,)),
                        Expanded(child: Center(child: Text(widget.condition)))
                      ],
                    ),
                  ),
                ),
                Container(
                    width: Constant.width,
                    height: 650,

                    ///这里ResultList()参数要替换
                    child: SearchResultList(
                      result: widget.result,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
