import 'package:flutter/material.dart';
import 'package:medical_retrieval/model/SearchResult.dart';
import 'package:medical_retrieval/widgets/my_card.dart';

import '../../../model/SearchAbs.dart';
import '../../../model/SearchDoc.dart';
import '../../../res/colors.dart';


class SearchResultList extends StatefulWidget {
  const SearchResultList({super.key, required this.result,});
  //final List<SearchResult> resultList;
  final List<SearchDoc> result;

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.result.length+1,
      itemBuilder: (BuildContext context, int index) {
        if(index<widget.result.length){
          return MyCard(
            title: widget.result[index].fileName,
            page: 10,
            source: '来源文本',
            abstract: 'widget.abs[index].data',
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
