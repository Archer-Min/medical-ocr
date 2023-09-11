import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/user_page/checkPage/inform_record.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              //头像
              Container(
                height: 94,
                width: 94,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.grey,
                  image: DecorationImage(image: AssetImage("assets/images/user.jpg"),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Archer',style: TextStyle(color: Colours.app_main,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('FZU',style: TextStyle(color: Colours.app_main),),
              ),
              SizedBox(height: 30,),
              Container(
                height: 500,
                width: Constant.width,
                child: ListView.separated(
                  itemCount: Constant.userInform.length,
                  itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                          return InformRecordPage(index: index,);
                        }));
                      },
                      child: Container(
                        height: 55,
                        width: Constant.width,
                        decoration: BoxDecoration(
                            color: Colours.material_bg,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0x1F1034A6),width: 0.6,),
                            boxShadow: [BoxShadow(color: Color(0x381034A6),spreadRadius: 0.8,blurRadius: 3,offset: Offset(0.2,0.5))]
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
                                    child: Icon(Constant.userInfomIcons[index],color: Colours.app_main,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      Constant.userInform[index],
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
