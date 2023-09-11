import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:medical_retrieval/pages/store/store_result.dart';
import 'package:medical_retrieval/pages/store/tag_category.dart';
import 'package:medical_retrieval/widgets/dropdown_buttom.dart';
import 'package:medical_retrieval/widgets/floating_button.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'dart:io';

import '../../res/colors.dart';
import '../../res/constant.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/result_list.dart';

class StoreWithUpload extends StatefulWidget {
  StoreWithUpload({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<StoreWithUpload> createState() => _StoreWithUploadState();
}

class _StoreWithUploadState extends State<StoreWithUpload>
    with SingleTickerProviderStateMixin {

  late String filePath;

  void pickPDF() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      File file = result.files.first as File;
      filePath = file.path!;
      print(filePath);

    } else {}
  }

  // void uploadPDF() async {
  //   try {
  //     var request = http.MultipartRequest("POST", Uri.parse("your_server_url"));
  //     request.files.add(await http.MultipartFile.fromPath("file", filePath));
  //     var response = await request.send();
  //     print(response.statusCode);
  //   } catch (e) {
  //     print("Error while uploading the file: " + e.toString());
  //   }
  // }

  final GlobalKey _parentKey = GlobalKey();

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
              // MyTextField(),
              // SizedBox(
              //   height: 6,
              // ),
              Tag(
                index: widget.index,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: Constant.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyDropDownButtom(
                        list: ['中文文献', '英文文献'],
                        dropdownValue: '中文文献',
                      ),
                      MyDropDownButtom(
                        list: ['升序', '降序'],
                        dropdownValue: '升序',
                      )
                    ],
                  ),
                ),
              ),
              Stack(key: _parentKey, children: [
                Container(
                    width: Constant.width,
                    height: 660,

                    ///这里ResultList()参数要替换
                    child: const StoreResultList(
                      resultList: [],
                    )),
                DraggableFloatingActionButton(
                  initialOffset: const Offset(250, 580),
                  parentKey: _parentKey,
                  onPressed: () {pickPDF;},
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color(0xFFD6E3FA),
                      shadows: [BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(-0.5,2)
                      )]
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        child: GestureDetector(
                          onTap: pickPDF,
                          child: Image(
                            color: Color(0xFF2977FB),
                            image: AssetImage('assets/images/上传 1.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          )),
        ),
      ),
    );
  }
}
