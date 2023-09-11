import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/home_page.dart';
import '../pages/search/search_router.dart';
import 'i_router.dart';

class Routes {

  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {

    router.define(home, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>const MyHomePage()));


    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(SearchRouter());


    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }
    _listRouter.forEach(initRouter);
  }
}
