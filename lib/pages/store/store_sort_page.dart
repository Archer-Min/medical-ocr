import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/store/store_upload.dart';
import 'package:medical_retrieval/widgets/my_card.dart';
import 'package:medical_retrieval/widgets/my_textfield.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';
import '../../widgets/result_list.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colours.bg_color,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 660,
                width: Constant.width,
                child: ListView.separated(
                    itemCount: Constant.category.length,
                    itemBuilder: (BuildContext context,int index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return StoreWithUpload(index: index,);
                          }));
                        },
                        child: Container(
                          height: 55,
                          width: Constant.width,
                          decoration: BoxDecoration(
                            color: Colours.material_bg,
                            borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0x1F1034A6),width: 0.6,),
                              boxShadow: [BoxShadow(color: Color(0x381034A6),spreadRadius: 0.5,blurRadius: 1,offset: Offset(0.2,0.5))]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Icon(Icons.folder,color: Colours.app_main,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        Constant.category[index],
                                        style: TextStyle(
                                            color: Colours.app_main,
                                            fontSize: Constant.storeSortCategorySize,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: GestureDetector(onTap:(){},child: Icon(Icons.arrow_forward_ios,color: Colours.tagFontColor,)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 15,);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
