import 'package:fluro/fluro.dart';
import 'package:medical_retrieval/pages/search/searchResult/search_result_list.dart';
import 'package:medical_retrieval/pages/search/the_home.dart';
import '../../router/i_router.dart';

class SearchRouter implements IRouterProvider{

  static String searchPage = '/search';
  static String searchResultPage = '/search/result';

  @override
  void initRouter(FluroRouter router) {
    router.define(searchPage, handler: Handler(handlerFunc: (_, __) => const HomePage()));
    //router.define(searchResultPage, handler: Handler(handlerFunc: (_, __) => const SearchResultList(resultList: [],)));
  }

}