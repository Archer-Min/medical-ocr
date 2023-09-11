import 'package:flutter/material.dart';
import 'package:medical_retrieval/model/SearchResult.dart';
import 'package:medical_retrieval/widgets/card_recommend.dart';
import 'package:medical_retrieval/widgets/my_card.dart';

import '../../res/colors.dart';

class RecommendResultList extends StatefulWidget {
  const RecommendResultList({super.key, required this.resultList});
  final List<Map<String,String>> resultList;

  @override
  State<RecommendResultList> createState() => _RecommendResultListState();
}

class _RecommendResultListState extends State<RecommendResultList> {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.resultList.length+1,
      itemBuilder: (BuildContext context, int index) {
        if(index<widget.resultList.length){
          return RecommendCard(
            title: widget.resultList[index]["title"]!,
            page: 10,
            source: '来源文本',
            abstract: widget.resultList[index]["abstract"]!,
            author: widget.resultList[index]["author"]!,
            word: widget.resultList[index]["word"]!,
          );
        }else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 36,
                width: 115,
                decoration:BoxDecoration(
                    border: Border.all(color: Colours.authorColor),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("没有更多数据了",style: TextStyle(color: Colours.authorColor,fontSize: 12),),
                ),),
            ],
          );
        }

      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 14,
        );
      },
    );
  }
}