import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/search_result_page.dart';
import 'package:medical_retrieval/pages/search/searchResult/search_result_list.dart';
import 'package:medical_retrieval/pages/search/search_router.dart';
import 'package:medical_retrieval/router/fluro_navigator.dart';

import '../common/net/api.dart';
import '../model/SearchDoc.dart';
import '../model/SearchResult.dart';
import '../res/colors.dart';
import '../res/constant.dart';
import '../res/myicons.dart';
///普通检索页面搜索框
class MyTextField extends StatefulWidget {
  MyTextField({Key? key, this.width,}) : super(key: key);

  double? width=Constant.width;
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  File? _imageFile;

  final _picker = ImagePicker();

  Future<void> _takePicture() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

    }
  }

  Future<void> _uploadPicture() async {
    // TODO: 实现图片上传逻辑
    if (_imageFile != null) {
      print('Uploading image: ${_imageFile!.path}');
    }
  }

  final TextEditingController _textEditingController = TextEditingController();
  List<SearchResult> _results = [];

  String input="";
  ///获取输入文字input，用于请求后端
  void getInput(String value){
    setState(() {
      value=_textEditingController.text;
    });
    input=value;
  }

  SearchResult _SearchResult=SearchResult(page: 1, title: '没可能3', author: '很快就', source: 'ghkkh', abstract: '可根据健康', totalScore: '90', score1: '39', score2: '37', score3: '29');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width:widget.width,
      child: TextField(
        maxLines: 1,
        cursorColor: Colours.app_main,
        controller: _textEditingController,
        onChanged: getInput,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          fillColor: Colours.material_bg,
          filled: true,
          suffixIcon: Container(
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(onTap:(){
                  _takePicture();
                },child: const Icon(Icons.camera_alt_outlined,color: Colours.app_main,)),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 8.0),
                  child: GestureDetector(
                    onTap: () async{
                      //请求得到标题
                      // final searchDocApi = SearchDocApi();
                      // Response response = await searchDocApi.searchDoc('thesis', input);
                      // List<Map<String, dynamic>> jsonArray = List<Map<String, dynamic>>.from(response.data);
                      //List<SearchDoc> searchDocList=jsonArray.map((e) => SearchDoc(fileName: e['fileName'], data: e['data'])).toList();

                      List<SearchDoc> searchDocList=[
                        SearchDoc(fileName: "fileName", data: "data")
                      ];
                      //print(SearchDoc.fromJson(jsonDecode(response.toString())));
                      // setState(() {
                      //   _results = (json.decode(response.data) as List)
                      //       .map((item) => SearchResult.fromJson(item))
                      //       .toList();
                      // });
                      // print(_results);
                      //跳转搜索结果列表页面
                      //NavigatorUtils.push(context, SearchRouter.searchResultPage);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context){
                        return SearchResultPage(result: searchDocList,);//此处应为_results,这里的_SearchResult是假的
                      }));
                    },
                    child: const Icon(MyFont.search,color: Colours.app_main,),),
                ),
              ],
            ),
          ),
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
