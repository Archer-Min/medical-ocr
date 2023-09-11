import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../res/colors.dart';

class DownloadTest extends StatelessWidget {
  const DownloadTest({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: Container(
        child: TextButton(
          onPressed: ()async{
            /// 获取app文件地址
            Directory storageDir = await getApplicationDocumentsDirectory();
            String storagePath = storageDir.path;
            File file = new File('$storagePath/世界上有趣的事太多.epub');

            if (!file.existsSync()) {
              file.createSync();
            }

            /// dio使用get下载文件
            try{
              var response = await Dio().get(
                  "http://ds.addsxz.com/912sjsyqds.epu",
                  onReceiveProgress: (num received, num total){ /// 获取下载进度
                    double _process = double.parse('${(received / total).toStringAsFixed(2)}');
                    print(_process);
                  },
                  options: Options(
                    responseType: ResponseType.bytes,
                    followRedirects: false,
                  )
              );
              file.writeAsBytesSync(response.data); /// 写入文件

            } on DioError catch(e) {
              print("response.statusCode: ${e.type}");
            }
          },
          child: Text('download'),
        ),
      ),
    );
  }
}
