import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/login_register/login_page.dart';
import 'package:medical_retrieval/pages/search/the_home.dart';
import 'package:medical_retrieval/pages/store/store_sort_page.dart';
import 'package:medical_retrieval/res/colors.dart';
import 'package:medical_retrieval/widgets/the_tabBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ///选中的标签
  int _tabIndex =0;
  ///图标区
  List<Icon> normalIcon = [
    Icon(Icons.home),
    Icon(Icons.folder_copy),
    Icon(Icons.people)
  ];

  List<String> normalTitle =[
    "首页",
    "消息",
    "我的"
  ];

  List<Widget> bodyWidgetList=[
    HomePage(),
    StorePage(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // return const DefaultTabController(
    //     length: 3,
    //     child: Scaffold(
    //       backgroundColor: Colours.bg_color,
    //       body: TabBarView(
    //         children: [
    //           SearchPage(),
    //           StorePage(),
    //           LoginPage()
    //         ],
    //       ),
    //       bottomNavigationBar: TheTabBar()
    //     ));
    return Scaffold(
      ///页面的主内容区
      ///可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body:bodyWidgetList[_tabIndex],
      ///底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  ///构建底部导航栏
  BottomNavigationBar buildBottomNavigation(){

    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: normalIcon[0], label:'首页' ),
        new BottomNavigationBarItem(
            icon:  normalIcon[1], label: '资料库'),
        new BottomNavigationBarItem(
            icon:  normalIcon[2], label: '用户中心'),
      ],
      ///显示效果
      type: BottomNavigationBarType.fixed,
      ///当前选中的页面
      currentIndex: _tabIndex,
      ///导航栏的背景颜色
      backgroundColor: Colors.white,
      ///选中时图标与文字的颜色
//      fixedColor: Colors.deepPurple,
      ///选中时图标与文字的颜色
      selectedItemColor: Colours.app_main,
      ///未选中时图标与文字的颜色
      unselectedItemColor: Color.fromARGB(255, 163, 179, 226),
      ///图标的大小
      iconSize: 24.0,
      ///点击事件
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }
}