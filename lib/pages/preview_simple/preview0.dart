import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/preview_simple/preview1.dart';
import 'package:medical_retrieval/res/colors.dart';

import '../../res/constant.dart';
import '../../widgets/image_button.dart';
import '../user_page/checkPage/InformRecordCard.dart';

class Preview0 extends StatefulWidget {
  const Preview0({Key? key}) : super(key: key);

  @override
  State<Preview0> createState() => _Preview0State();
}

class _Preview0State extends State<Preview0> {
  String totalScore='90';
  String score1='30';
  String score2='40';
  String score3='20';
  String title='标题这是一个标题啊这是一个标题这是一个标题是一个标题是一个标题';
  String author='作者author';
  String abstract='这是一个摘要是一个摘要是一个摘要事业个摘要是一个摘要是一个摘要是一个摘要事业个摘要是一个摘要摘要摘要这是一个摘要这是一个摘要是一个摘要是一个摘要';

  int _clickTime = 0;
  int _thumbTime = 0;
  int _starTime = 0;
  int _downloadTime = 0;

  void clickCount() {
    setState(() {
      _clickTime++;
    });
  }

  void downloadCount() {
    setState(() {
      _downloadTime++;
    });
  }

  void thumbCountAdd(){
    setState(() {
      _thumbTime++;
    });
  }

  void thumbCountMinus(){
    setState(() {
      _thumbTime--;
    });
  }

  void starCountAdd(){
    setState(() {
      _starTime++;
    });
  }

  void starCountMinus(){
    setState(() {
      _starTime--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: Constant.width,
              child: Column(
                children: [
                  //分数显示
                  Container(
                    height: 32,
                    width: Constant.width,
                    decoration: BoxDecoration(
                      color: Colours.material_bg,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colours.app_main)
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text("总分:$totalScore",style: TextStyle(color: Colours.app_main,fontSize: 15,fontWeight: FontWeight.w400),),
                        ),
                        GestureDetector(
                          child: Icon(Icons.arrow_right,size: 27,),
                          onTap: (){},),
                        Text("内容相关度:$score1 点击率:$score2 用户反馈:$score3",
                          style: TextStyle(color: Colours.app_main,fontSize: 12,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  //一些按钮
                  Container(
                    width: Constant.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImageButton(
                          imagePath: "assets/images/eye.png",
                          clickTime: _clickTime,
                        ),
                        const SizedBox(width: 8,),
                        ButtonContainer1(Colours.thumbUpBottomColor,Colours.clickBefore,Colours.lightThumb, Icons.thumb_up, _thumbTime),
                        const SizedBox(width: 8,),
                        ButtonContainer2(Colours.starBottomColor,Colours.clickBefore,Colours.lightStar,  Icons.star_rounded, _starTime),
                        const SizedBox(width: 8,),
                        ButtonContainer3(Colours.downloadBottomColor,Colours.clickBefore2,Colours.lightDownload,  Icons.download_outlined, _downloadTime),
                        // Container(
                        //   height: 30,
                        //   width: 35,
                        //   decoration: BoxDecoration(
                        //     color: Colours.app_main,
                        //     borderRadius: BorderRadius.circular(10)
                        //   ),
                        //   child: InkWell(
                        //     child: Image(
                        //       image: AssetImage('assets/images/download.png'),
                        //       color: Colors.white,
                        //     ),
                        //     onTap: ()async{
                        //
                        //       /// 获取app文件地址
                        //       Directory storageDir = await getApplicationDocumentsDirectory();
                        //       String storagePath = storageDir.path;
                        //       print(storagePath);
                        //       File file = new File('$storagePath/YM_2016102717132839.pdf');
                        //
                        //       if (!file.existsSync()) {
                        //         file.createSync();
                        //       }
                        //
                        //       /// dio使用get下载文件
                        //       try{
                        //         var response = await Dio().get(
                        //             "https://www.scirp.org/pdf/YM_2016102717132839.pdf",
                        //             onReceiveProgress: (num received, num total){ /// 获取下载进度
                        //               double _process = double.parse('${(received / total).toStringAsFixed(2)}');
                        //               print(_process);
                        //             },
                        //             options: Options(
                        //               responseType: ResponseType.bytes,
                        //               followRedirects: false,
                        //             )
                        //         );
                        //         file.writeAsBytesSync(response.data); /// 写入文件
                        //
                        //       } on DioError catch(e) {
                        //         print("response.statusCode: ${e.type}");
                        //       }
                        //
                        //
                        //     },//下载pdf请求
                        //   )
                        // )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(title,
                    style: TextStyle(color: Colours.titleColor,fontSize: Constant.titleSize+3),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0,bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(author,style: TextStyle(color: Colours.authorColor,fontSize: Constant.authorSize+3),),
                      ],
                    ),
                  ),
                  Text(abstract,
                    style:(TextStyle(color: Colours.summaryColor,fontSize: Constant.summarySize+3)),
                    maxLines: 5,),
                  //在线阅读按钮
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          //margin: EdgeInsets.only(bottom: 10),
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colours.downloadBottomColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                      return Preview1();
                                    }));
                                  },
                                    child: Text('在线阅读',style: TextStyle(color: Colours.lightDownload))
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //推荐文献
                  Padding(
                    padding: const EdgeInsets.only(bottom:3.0),
                    child: Container(
                      width: Constant.width,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('推荐文献',
                                    style: TextStyle(
                                        color: Colours.tagFontColor,
                                        fontSize: Constant.tagFontSize)),
                              ),
                            ],
                          ),
                          Container(
                            height: 4,
                            width: 230,
                            decoration: BoxDecoration(
                                color: Colours.tagColor,
                                borderRadius: BorderRadius.circular(16)),
                          )
                        ],
                      ),
                    ),
                  ),
              Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',),
              Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',),
              Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18',),
              Card1(title: 'FOCUS 超声刀开放性甲状腺切除术的临床疗效评价', author: '作者', date: '2000.2.18'),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
  var iconColorA=Colours.clickBefore;
  var iconColorB=Colours.clickBefore;
  Widget ButtonContainer1(Color bgcolor,Color iconColor1,Color iconColor2,IconData icon,int label){

    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      height: 20,
      width: 60,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            GestureDetector(onTap: () {
              print(label);
              setState(() {
                if(iconColorA==iconColor1){
                  iconColorA=iconColor2;
                  thumbCountAdd();
                }else{
                  iconColorA=iconColor1;
                  thumbCountMinus();
                }

              });

            },
                child: Icon(icon,size: 18,color: iconColorA,)),
            Text(label.toString(),style: TextStyle(color: Colours.starTimeColor),)
          ],
        ),
      ),
    );
  }
  Widget ButtonContainer2(Color bgcolor,Color iconColor1,Color iconColor2,IconData icon,int label){

    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      height: 20,
      width: 60,
      decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            GestureDetector(onTap: () {
              print(label);
              setState(() {
                if(iconColorB==iconColor1){
                  iconColorB=iconColor2;
                  starCountAdd();
                }else{
                  iconColorB=iconColor1;
                  starCountMinus();
                }

              });

            },
                child: Icon(icon,size: 18,color: iconColorB,)),
            Text(label.toString(),style: TextStyle(color: Colours.starTimeColor))
          ],
        ),
      ),
    );
  }
  Widget ButtonContainer3(Color bgcolor,Color iconColor1,Color iconColor2,IconData icon,int label){

    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      height: 20,
      width: 60,
      decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            GestureDetector(onTap: () {
              print(label);
              setState(() {
                downloadCount();
              });

            },
                child: Icon(icon,size: 18,color: iconColor1,)),
            Text(label.toString(),style: TextStyle(color: Colours.lightDownload))
          ],
        ),
      ),
    );
  }
}
