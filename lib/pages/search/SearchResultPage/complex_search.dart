import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/Widget/date_selector.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/Widget/history_container.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/Widget/my_textfiled_complex.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/complex_search_page.dart';
import 'package:medical_retrieval/widgets/dropdown_buttom.dart';

import '../../../common/net/api.dart';
import '../../../model/SearchAbs.dart';
import '../../../model/SearchDoc.dart';
import '../../../model/SearchResult.dart';
import '../../../res/colors.dart';
import '../../../res/constant.dart';
import 'Widget/dropDownButtom_complex.dart';

class ComplexSearchPage extends StatefulWidget {
  const ComplexSearchPage({Key? key}) : super(key: key);

  @override
  State<ComplexSearchPage> createState() => _ComplexSearchPageState();
}

class _ComplexSearchPageState extends State<ComplexSearchPage> {

  String formula = '';
  String input="";
  String _inputValue = '';

  List<SearchDoc> searchDocList=[SearchDoc(fileName: 'fileName', data:' data')];
  List<SearchAbs> searchAbsList=[SearchAbs(msg: 'msg', data: 'data',)];

  void _handleInputChange(String value) {
    setState(() {
      _inputValue = _inputValue+value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //返回箭头
          Container(
            width: Constant.width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(onTap:(){},child: Icon(Icons.arrow_back_ios_new,color: Colours.tagFontColor,)),
                ],
              ),
            ),
          ),
          //输入框
          Container(
            width: Constant.width,
            child: Column(
              children: list,
            )
          ),
          //日期选择
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: Constant.width,
              child: Row(
                children: [
                  Text('日期',style: TextStyle(color:Colours.dateTextColor,fontSize: 13),),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: DateSelector(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Container(height: 2,width:16,decoration: BoxDecoration(color: Colours.tagColor,borderRadius: BorderRadius.circular(20)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: DateSelector(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Container(height:24,child: MyDropDownButtom(list: ['中文文献','英文文献'], dropdownValue: '中文文献')),
                  )
                ],
              ),
            ),
          ),
          //检索按钮
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              onTap: ()async{
                print(_inputValue);
                // final searchDocApi = SearchDocApi();
                // Response response = await searchDocApi.searchDoc('thesis', input);
                // List<Map<String, dynamic>> jsonArray = List<Map<String, dynamic>>.from(response.data);
                // List<SearchDoc> searchDocList=jsonArray.map((e) => SearchDoc(fileName: e['fileName'], data: e['data'])).toList();
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ComplexSearchResultPage(result:searchDocList, condition: _inputValue, abs: searchAbsList,);
                    }));
              },
              child: Container(
                width: Constant.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: Constant.complexSearchButtonHeight,
                      width: Constant.complexSearchButtonWidth,
                      decoration: BoxDecoration(
                        color: Colours.app_main,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('检  索',style: TextStyle(color: Colours.material_bg),)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //历史记录
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: promptText(),
          ),
          Container(
            width: Constant.width,
            child: Column(
              children: list2,
            ),
          )
        ],
      ),
    );
  }


  List<Widget> list=[];
  void initState() {
    super.initState();
    list.add(selectRow());
  }
  List<Widget> list2=[];

  void addTextField(){
    setState(() {
      list.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: MyDropDownButtom(list: ['与','或'], dropdownValue: '与'),
          )
      );
      list.add(
        selectRow2(),
      );
    });
  }

  void removeTextField(){
    setState(() {
      list.remove(
          list[list.length-1]
      );
      list.remove(
        list[list.length-1],
      );
    });
  }

  Widget selectRow(){
    MyTextField2 field1= new MyTextField2(width: Constant.width-56, textEditingController: TextEditingController(),
      onTextChanged: _handleInputChange,);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          field1,
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: GestureDetector(
                onTap: (){
                  addTextField();
                  },
                child: Icon(Icons.add_circle_outlined,color: Colours.addSelectColor,)),
          )
        ],
      ),
    );
  }

  Widget selectRow2(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          MyTextField2(width: Constant.width-56, textEditingController: TextEditingController(),
            onTextChanged: _handleInputChange,),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: GestureDetector(
                onTap: addTextField,
                child: Icon(Icons.add_circle_outlined,color: Colours.addSelectColor,)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: GestureDetector(
                onTap: removeTextField,
                child: Icon(Icons.remove_circle_outlined,color: Colours.addSelectColor,)),
          ),
        ],
      ),
    );
  }

  String prompt="查看历史记录箭头↓";
  String prompt2="隐藏历史记录";
  Widget promptText(){
    return GestureDetector(
        onTap: (){
          setState(() {
            if(prompt=='查看历史记录箭头↓'){
              prompt='隐藏历史记录';
              showHistory();
            }else{
              prompt='查看历史记录箭头↓';
              hideHistory();
            }

          });
        },
        child: Text(prompt,style: TextStyle(color: Colours.dateTextColor),));
  }

  List<Widget> list2show=[
    HistoryContainer(history: 'history嗨', date: '2023.1.2'),
    HistoryContainer(history: 'history嗨', date: '2023.1.2'),
    HistoryContainer(history: 'history嗨', date: '2023.1.2'),
    HistoryContainer(history: 'history嗨', date: '2023.1.2'),
  ];
  List<Widget> list2hide=[];

  void showHistory(){
    setState(() {
      list2=list2show;
    });
  }
  void hideHistory(){
    setState(() {
      list2=list2hide;
    });
  }

}


// class MyTextField3 extends StatefulWidget {
//   MyTextField3({Key? key, this.width,}) : super(key: key);
//
//   double? width=Constant.width;
//
//   @override
//   _MyTextField3State createState() => _MyTextField3State();
// }
//
//
// class _MyTextField3State extends State<MyTextField3> {
//   final TextEditingController _textEditingController = TextEditingController();
//   List<SearchResult> _results = [];
//
//   String input="";
//   ///获取输入文字input，用于请求后端
//   void getInput(String value){
//     setState(() {
//       value=_textEditingController.text;
//     });
//     input=value;
//   }
//
//   String getValue(){
//     return input;
//   }
//
//   SearchResult _SearchResult=SearchResult(page: 1, title: '没可能3', author: '很快就', source: 'ghkkh', abstract: '可根据健康', totalScore: '90', score1: '39', score2: '37', score3: '29');
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 36,
//       width:widget.width,
//       child: TextField(
//         maxLines: 1,
//         cursorColor: Colours.app_main,
//         controller: _textEditingController,
//         onChanged: getInput,
//         style: TextStyle(fontSize: 16),
//         decoration: InputDecoration(
//           fillColor: Colours.material_bg,
//           filled: true,
//           suffixIcon: MyDropDownButtom2(list: ['精确','模糊'], dropdownValue: '精确',location: 2,),
//           prefixIcon: MyDropDownButtom2(list: ['关键词','篇名','作者','摘要'], dropdownValue: '关键词',location: 1,),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colours.app_main),
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colours.selectButtonColor,width: 2)
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colours.selectButtonColor,width: 2)
//           ),
//         ),
//       ),
//     );
//   }
// }