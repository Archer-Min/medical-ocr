import 'package:flutter/material.dart';

import '../../../../res/colors.dart';

//日期选择器封装类
class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? dateTime; //DateTime代表某个时刻,时区

  void din() {
    showDatePicker(
      //showDatePicker是封装了TearPicker和MonthPicker进行了联动
      //日期选择器
        context: context,
        builder: (context,child){
          return Theme(data: ThemeData(cardColor: Colours.addSelectColor,brightness: Brightness.dark), child: child!);
        },
        initialDate:
        DateTime.now(), //初始化时间，通常设置为当前时间 //DateTime.now用于显示当前时间
        firstDate: DateTime(2000), //表示开始的时间，不能选择此时间之前的时间
        lastDate: DateTime(2025)) //表示结束时间,不能选择此时间之后的时间
        .then((dis) {
      setState(() {
        dateTime = dis; //当你选择时间后,将获取到的dis值赋值给dateTime
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //获取屏幕的大小
    return GestureDetector(
      //点击事件监听
      onTap: () {
        din(); //单击执行 din方法用于选择日期
      },
      child: Container(
        width: 83, //占满全屏减去40的像素
        height: 24,
        decoration: BoxDecoration(color: Colours.material_bg,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colours.selectButtonColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Center(
            child: Text(dateTime != null
                ? dateTime.toString().substring(
                0, 10) //dateTime将此类型转化为String类型,subString用于显示区间内的文字
                : "",style: TextStyle(fontSize: 10,),),
          ),
        ),
      ),
    );
  }
}