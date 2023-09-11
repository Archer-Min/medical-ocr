import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/search_ways_page.dart';
import 'package:medical_retrieval/pages/search/searchResult/search_result_list.dart';
import 'package:medical_retrieval/pages/search/search_router.dart';
import 'package:medical_retrieval/router/fluro_navigator.dart';
import 'package:medical_retrieval/widgets/dropdown_buttom.dart';

import '../../../../model/SearchResult.dart';
import '../../../../res/colors.dart';
import '../../../../res/constant.dart';
import '../../../../res/myicons.dart';
import 'dropDownButtom_complex.dart';
///输入框
class MyTextField2 extends StatefulWidget {
  MyTextField2({Key? key, this.width,required this.textEditingController, this.onTextChanged}) : super(key: key);

  double? width=Constant.width;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onTextChanged;
  String input="";


  @override
  State<MyTextField2> createState() => MyTextField2State();
}


class MyTextField2State extends State<MyTextField2> {
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    if (widget.onTextChanged != null) {
      widget.onTextChanged!(widget.textEditingController.text);
    }
  }

  List<SearchResult> _results = [];



  SearchResult _SearchResult=SearchResult(page: 1, title: '没可能3', author: '很快就', source: 'ghkkh', abstract: '可根据健康', totalScore: '90', score1: '39', score2: '37', score3: '29');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width:widget.width,
      child: TextField(
        maxLines: 1,
        cursorColor: Colours.app_main,
        controller: widget.textEditingController,
        //onChanged: (){},
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          fillColor: Colours.material_bg,
          filled: true,
          suffixIcon: MyDropDownButtom2(list: ['精确','模糊'], dropdownValue: '精确',location: 2,),
          prefixIcon: MyDropDownButtom2(list: ['关键词','篇名','作者','摘要'], dropdownValue: '关键词',location: 1,),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colours.app_main),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colours.selectButtonColor,width: 2)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colours.selectButtonColor,width: 2)
          ),
        ),
      ),
    );
  }

}