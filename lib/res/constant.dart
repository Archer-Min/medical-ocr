import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
///组件的长宽，文字，字体大小，粗细
class Constant {
  ///列表卡片的长与宽
  static const double width = 325;
  static const double cardHeight = 135;

  static const double complexSearchButtonHeight=28;
  static const double complexSearchButtonWidth=120;

  static const double titleSize=17;
  static const double authorSize=13;
  static const double summarySize=15;
  static const double totalScoreSize=13;
  static const double scoreSize=11;
  static const double storeSortCategorySize=16;

  static const double tagFontSize=16;
  static const double selectFontSize=14;



  static const List<String> category=['全部','基础医学','临床医学','口腔科学','公共卫生和预防','儿科学','心理学','药学','肿瘤学','护理',];
  static const List<String> registerInform=['公司名称','用户名','密码','确认密码','联系人','联系电话','邮箱','公司所在地',];
  static const List<String> userInform=['浏览记录','点赞记录','收藏记录','批注保存'];

  static const List<IconData> userInfomIcons=[CupertinoIcons.clock,Icons.thumb_up,Icons.star_rounded,Icons.edit_note];
}
