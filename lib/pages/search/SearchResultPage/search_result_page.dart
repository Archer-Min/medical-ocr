import 'package:flutter/material.dart';

import '../../../model/SearchAbs.dart';
import '../../../model/SearchDoc.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import '../../../widgets/dropdown_buttom.dart';
import '../../../widgets/my_textfield.dart';
import '../searchResult/search_result_list.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key, required this.result,}) ;
  final List<SearchDoc> result;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,

      // bottomNavigationBar: BottomAppBar(
      //   color: Colours.app_main,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height:43,
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
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

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: Constant.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyDropDownButtom(
                            list: ['关键词','篇名','作者','摘要'],
                            dropdownValue: '关键词',
                          ),
                          MyDropDownButtom(
                            list: ['全部', '基础医学','临床医学','口腔科学','公共卫生和预防','儿科学','心理学','药学','肿瘤学','护理',],
                            dropdownValue: '全部',
                          ),
                          MyDropDownButtom(
                            list: ['升序', '降序'],
                            dropdownValue: '升序',
                          )
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
              )),
        ),
      ),
    );
  }
}
