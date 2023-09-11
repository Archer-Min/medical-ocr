import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';


class Preview1 extends StatefulWidget {
  const Preview1({Key? key}) : super(key: key);

  @override
  _Preview1State createState() => _Preview1State();
}

class _Preview1State extends State<Preview1> {

  final sampleUrl = 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';//'http://www.pdf995.com/samples/pdf.pdf'

  String? pdfFlePath;
  var search=false;
  TextEditingController _searchController=TextEditingController();

  Future<void> downloadPdf(String url) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String pdfPath = '${appDirectory.path}/my_pdf_file.pdf';
    final file = File(pdfPath);

    final Dio dio = Dio();
    try {
      if(await file.exists()){
        print('已下载过该文件');
      }else{
        await dio.download(url, pdfPath);
        print('PDF downloaded successfully');
      }
    } catch (e) {
      print('Failed to download PDF: $e');
    }
  }

  void openPDFFile(String filePath) async {
    if (await canLaunch(filePath)) {
      await launch(filePath);
    } else {
      debugPrint('Could not launch $filePath');
    }
  }

  // 保存输入框中的文本
  String _inputText = '';

  void _showAddNoteModal(BuildContext context,) {
    String noteText = '';

    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 237, 238, 244),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 290,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 238, 244),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  '添加批注',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colours.app_main
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 115,
                    width: 339,
                    decoration: BoxDecoration(
                        color: Colours.material_bg,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: TextField(
                        maxLines: null,
                        onChanged: (value) {
                          noteText = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '输入批注',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('取消',style: TextStyle(color: Colours.app_main),),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: 保存批注，并添加到指定位置
                        print('保存批注: $noteText');
                        Navigator.pop(context);

                      },
                      child: Text('提交批注'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colours.app_main),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  String show ='显示';
  String hide ='隐藏';
  String tag ='显示';
  int t =1;

  late PdfViewerController _pdfViewerController;
  late PdfTextSearchResult _searchResult;
  bool _showHighlight = false;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    super.initState();
  }

  OverlayEntry? _overlayEntry;
  void _showContextMenu(BuildContext context,PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child:
        Row(
          children: [
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                  255, 212, 222, 254))),
              child: Text('Copy',style: TextStyle(fontSize: 17,color: Colors.black26)),onPressed: (){
              Clipboard.setData(ClipboardData(text: ""));
              _pdfViewerController.clearSelection();
            },),

          ],
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: Constant.width,
              child: Column(
                children: [
                  Container(
                    height: 32,
                    width: Constant.width,
                    decoration: BoxDecoration(
                        color: Colours.material_bg,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colours.app_main)
                    ),
                    child: search==false?
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('批注',style: TextStyle(color: Colours.app_main,fontSize: 12,fontWeight: FontWeight.w400)),
                        ),
                        //显示还是隐藏按钮
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                height: 22,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 212, 222, 254),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        if(t==1){
                                          setState(() {
                                            t=2;
                                            tag=hide;
                                          });
                                        }else if(t==2){
                                          setState(() {
                                            t=1;
                                            tag=show;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 16,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colours.app_main
                                        ),
                                        child:
                                        t==1? Container():Center(
                                          child: Container(
                                            height: 12,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(255, 212, 222, 254)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Text(tag,style: TextStyle(color: Colours.app_main,fontSize: 12,fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ),
                            )),
                        //选择批注按钮
                        GestureDetector(
                          onTap: (){
                            _showAddNoteModal(context);
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: 22,
                                width: 65,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 212, 222, 254),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text('选择批注',style: TextStyle(color: Colours.app_main,fontSize: 12,fontWeight: FontWeight.w400))),
                              )),
                        ),
                        //查找按钮
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 22,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 212, 222, 254),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child:
                              GestureDetector(
                                onTap: (){
                                  setState(() {search=true;});
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0,right: 3),
                                      child: Icon(Icons.manage_search,color: Colours.app_main,size: 21,),
                                    ),
                                    Text('查找',style: TextStyle(color: Colours.app_main,fontSize: 12,fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              )),
                            )),
                        //导出下载按钮
                        GestureDetector(
                          onTap: (){
                            downloadPdf(sampleUrl);
                            openPDFFile(sampleUrl);
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: 22,
                                width: 65,
                                decoration: BoxDecoration(
                                  color: Colours.downloadBottomColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text('导出',style: TextStyle(color: Colours.app_main,fontSize: 12,fontWeight: FontWeight.w400))),
                              )),
                        ),
                      ],
                    ):
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: Container(
                            width: 20,
                            child: Row(
                              children: [
                                GestureDetector(
                                    child: Icon(Icons.manage_search,color: Colours.app_main,size: 21,),
                                  onTap: (){
                                    _searchResult = _pdfViewerController.searchText(_searchController.text,
                                    );
                                    if (kIsWeb) {
                                      setState(() {});
                                    } else {
                                      _searchResult.addListener(() {
                                        if (_searchResult.hasResult) {
                                          setState(() {});
                                        }
                                      });
                                    }
                                  },
                                ),
                                GestureDetector(
                                  child: Icon(Icons.cancel,color: Colours.app_main,size: 21,),
                                  onTap: (){
                                    setState(() {
                                      _searchResult.clear();
                                      search=false;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        child: Stack(
                          children: [
                            SfPdfViewer.network(
                              "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
                            onTextSelectionChanged:
                                (PdfTextSelectionChangedDetails details) {
                              if (details.selectedText == null && _overlayEntry != null) {
                                _overlayEntry?.remove();
                                _overlayEntry = null;
                              } else if (details.selectedText != null && _overlayEntry == null) {
                                //_showHighlight = details.selectedText != null;
                                _showContextMenu(context, details);
                              }
                            },
                            controller: _pdfViewerController,
                            currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
                            otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
                          ),
                            // Align(
                            //   alignment: Alignment.topCenter,
                            //   child: Container(
                            //     height: 20,
                            //     width: 20,
                            //     decoration: BoxDecoration(
                            //       color: Colors.red,
                            //     ),
                            //   ),
                            // )
                          ]
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

// class Preview1 extends StatefulWidget {
//   const Preview1({Key? key}) : super(key: key);
//
//   @override
//   _Preview1State createState() => _Preview1State();
// }
//
// class _Preview1State extends State<Preview1> {
//   bool _flag = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               this._flag ? _getMoreWidget() : Text(""),
//               Expanded(
//                   child: Stack(
//                       children: [
//                         InAppWebView(
//                           //老版本：initialUrl    新版本：initialUrlRequest
//                           initialUrlRequest: URLRequest(
//                               url: Uri.parse(
//                                   "https://docs.google.com/viewer?embedded=true&url=https://www.pdf995.com/samples/pdf.pdf")),
//                           onProgressChanged: (controller, progress) {
//                             if (progress / 100 > 0.9999) {
//                               setState(() {
//                                 this._flag = false;
//                               });
//                             }
//                           },
//                         ),
//                       ]
//                   ))
//             ],
//           ),
//         ));
//   }
//
//   //自定义加载中的组件
//   Widget _getMoreWidget() {
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.only(top: 80.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '加载中...',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             CircularProgressIndicator(
//               strokeWidth: 2.0,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }