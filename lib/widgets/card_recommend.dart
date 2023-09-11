import 'package:flutter/material.dart';
import 'package:medical_retrieval/widgets/image_button.dart';

import '../pages/preview_simple/preview0.dart';
import '../res/colors.dart';
import '../res/constant.dart';

class RecommendCard extends StatefulWidget {
  const RecommendCard({
    super.key,
    required this.title,
    required this.author,
    required this.page,
    required this.source,
    required this.abstract,
    required this.word,
  });

  final String title;
  final String author;
  final String word;
  final int page;
  final String source;
  final String abstract;

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 1.3,right: 1.3),
      child: Container(
        decoration: BoxDecoration(
            color: Colours.material_bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0x1F1034A6),width: 0.6,),
            boxShadow: [BoxShadow(color: Color(0x381034A6),spreadRadius: 0.5,blurRadius: 1,offset: Offset(0.2,0.5))]
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///标题
              ///点击标题跳转到第一页
              GestureDetector(
                onTap: () {
                  clickCount();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return Preview0();
                      }));
                },
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colours.titleColor, fontSize: Constant.titleSize,fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.author,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(color: Colours.authorColor,fontSize: Constant.authorSize),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Text(
                widget.word,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colours.scoreColor,fontSize: Constant.authorSize),
              ),
              SizedBox(height: 4,),
              GestureDetector(
                onTap: () {
                  clickCount();
                }, //点击摘要跳转到具体来源这一页
                child: Text(
                  widget.abstract,
                  style: const TextStyle(color: Colours.summaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/score.png"),
              //     Container(
              //       width: 160,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "总分:${widget.totalScore}",
              //             style: const TextStyle(
              //                 color: Colours.scoreColor, fontSize: Constant.totalScoreSize),
              //           ),
              //           Text(
              //             "内容相关:${widget.score1} 点击率:${widget.score2} 用户反馈:${widget.score3}",
              //             style: const TextStyle(
              //                 color: Colours.scoreColor, fontSize: Constant.scoreSize),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ImageButton(
                    imagePath: "assets/images/eye.png",
                    clickTime: _clickTime,
                  ),
                  // ImageButton2(imagePath: "assets/images/点赞 1.png", likeOrUnlikeTime: 100,),
                  // ImageButton2(imagePath: "assets/images/踩.png",likeOrUnlikeTime: 100,),
                  const SizedBox(width: 8,),
                  ButtonContainer1(Colours.thumbUpBottomColor,Colours.clickBefore,Colours.lightThumb, Icons.thumb_up, _thumbTime),
                  const SizedBox(width: 8,),
                  ButtonContainer2(Colours.starBottomColor,Colours.clickBefore,Colours.lightStar,  Icons.star_rounded, _starTime),
                  //const SizedBox(width: 8,),
                  //ButtonContainer3(Colours.downloadBottomColor,Colours.clickBefore2,Colours.lightDownload,  Icons.download_outlined, _downloadTime),
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
              )
            ],
          ),
        ),
      ),
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
