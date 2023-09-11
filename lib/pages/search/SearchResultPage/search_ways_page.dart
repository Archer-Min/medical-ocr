import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/complex_search.dart';
import 'package:medical_retrieval/pages/search/SearchResultPage/simple_search.dart';

import '../../../res/colors.dart';
import '../../../res/constant.dart';

class SearchWayPage extends StatefulWidget {
  const SearchWayPage({Key? key}) : super(key: key);

  @override
  State<SearchWayPage> createState() => _SearchWayPageState();
}

class _SearchWayPageState extends State<SearchWayPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
      length: 2, vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colours.bg_color,
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 17, 200, 253),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2,
            unselectedLabelStyle: TextStyle(
              fontSize: Constant.tagFontSize,
            ),

            unselectedLabelColor: Colours.tagColor,

            labelColor: Colours.app_main,

            labelStyle: TextStyle(
                fontSize: Constant.tagFontSize,
                fontWeight: FontWeight.w500
            ),
            controller: tabController,
            tabs: <Widget>[
              Tab(text: '普通检索',),
              Tab(text: '高级检索',),
            ],

          ),

        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          SimpleSearchPage(),
          ComplexSearchPage(),
        ],
      ),
    );
  }
}
