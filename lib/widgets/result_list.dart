import 'package:flutter/material.dart';
import 'package:medical_retrieval/model/SearchResult.dart';
import 'package:medical_retrieval/widgets/my_card.dart';

import '../res/colors.dart';

class ResultList extends StatefulWidget {
  const ResultList({super.key, required this.resultList});
  final List<SearchResult> resultList;

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        if(index<5){
          return MyCard(
            title: 'widget.resultList[index].title',
            page: 10,
            source: '来源文本',
            abstract: 'widget.resultList[index].abstract,hfalisdifhddddddddddjjjkjglvljj90989786fghm',
            totalScore: '100',
            score1: '20',
            score2: '30',
            score3: '50',
            author: 'author',
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
