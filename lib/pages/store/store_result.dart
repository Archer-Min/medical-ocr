import 'package:flutter/material.dart';
import 'package:medical_retrieval/model/SearchResult.dart';
import 'package:medical_retrieval/widgets/my_card.dart';

import '../../res/colors.dart';


class StoreResultList extends StatefulWidget {
  const StoreResultList({super.key, required this.resultList});
  final List<SearchResult> resultList;

  @override
  State<StoreResultList> createState() => _StoreResultListState();
}

class _StoreResultListState extends State<StoreResultList> {

  ListView listView=ListView.separated(
    itemCount: 6,
    itemBuilder: (BuildContext context, int index) {
      if(index<5){
        return MyCard(
          title: '抗心律失常药在心力衰竭中的临床应用',
          page: 10,
          source: '来源文本',
          abstract: '医疗水平提升使心脏病患者的生存期延长,心力衰竭患病率亦呈上升趋势。 心力衰竭患者常见并发心律失常,且发生心脏性猝死(SCD)的风险极高。 如何防治心力衰竭,尤其是射血分数降低的心力衰竭(HFrEF)患者的心律失常及 SCD,是临床面临的棘手问题。 抗心律失常药的不良反应极大地限制了其在心力衰竭并心律失常中的临床应用,且药物防治 SCD 的作用极为有限。 本文从临床角度,简述了近年来有关心力衰竭与心律失常的关联、抗心律失常药在心力衰竭临床应用的最新观点,为临床医师提供参考。',
          totalScore: '80',
          score1: '20',
          score2: '30',
          score3: '50',
          author: '伍卫',
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
  @override
  Widget build(BuildContext context) {
    return listView;
  }


}