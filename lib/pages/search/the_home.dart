import 'package:flutter/material.dart';
import 'package:medical_retrieval/pages/search/recommend_result.dart';
import 'package:medical_retrieval/res/myicons.dart';
import 'package:medical_retrieval/widgets/my_textfield.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';
import '../../widgets/result_list.dart';
import '../store/tag_category.dart';
import 'SearchResultPage/search_ways_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              //首页顶部搜索框不能输入点击跳转到搜索方式选择页面
              GestureDetector(
                onTap: () async {
                  //请求搜索结果
                  // final searchApi = SearchApi();
                  // Response response = await searchApi.search(input);
                  // //接受的数据存贮为_results列表
                  // setState(() {
                  //   _results = (json.decode(response.data)["results"] as List)
                  //       .map((item) => SearchResult.fromJson(item))
                  //       .toList();
                  // });
                  //跳转搜索结果列表页面
                  //NavigatorUtils.push(context, SearchRouter.searchResultPage);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SearchWayPage(); //此处应为_results,这里的_SearchResult是假的
                  }));
                },
                child: Container(
                  height: 36,
                  width: Constant.width,
                  decoration: BoxDecoration(
                    color: Colours.material_bg,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: Colours.selectButtonColor, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 6.0),
                            child: Icon(
                              MyFont.search,
                              color: Colours.app_main,
                            ),
                          ),
                          Text(
                            '搜索',
                            style: TextStyle(color: Colours.app_main),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:3.0),
                child: Container(
                  width: Constant.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('推荐文献',
                                style: TextStyle(
                                    color: Colours.tagFontColor,
                                    fontSize: Constant.tagFontSize)),
                          ),
                        ],
                      ),
                      Container(
                        height: 4,
                        width: 230,
                        decoration: BoxDecoration(
                            color: Colours.tagColor,
                            borderRadius: BorderRadius.circular(16)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  width: Constant.width,
                  height: 650,

                  ///这里ResultList()参数要替换
                  child: const RecommendResultList(
                    resultList: [
                      {
                        "title":"2016IJC-导管组织接触对于模型的影响",
                        "author":"PentarRay FAM",
                        "word":"关键词：Catheter ablation  Atrial fifibrillation  Contact force",
                        "abstract":"Background: A high catheter tip-tissue contact force (CF) with the myocardium may cause 3-dimensional (3D) map distortion, however, the inflfluence of external structures surrounding the left atrium (LA) on that distortion remains unknown. This study characterized the impact of high CF mapping on the local LA geometry distortion. Methods: Thirty AF patients underwent 3D-ultrasound merged with CT images (3D-Merge-CT). The LA area in contact with external structures was identifified by enhanced CT. Fast-electroanatomical-mapping (FAM) geom etries were created by two methods, point-by-point mapping with high (N10 g) CFs (high-CF guided-FAM), followed by that with multielectrode-mapping catheters (conventional-FAM). The resulting geometries were compared with the 3D-Merge-CT images.",
                      },
                      {
                        "title":"ENSITE_NAVX和双LAS_省略_左心房线性消融治疗阵发性心房颤动",
                        "author":"陈明龙 邹建刚 徐东杰 杨兵 陈椿 单其俊 李闻奇 曹克将",
                        "word":"关键词：心房颤动; 导管消融术; 肺静脉",
                        "abstract":"在 EnSite-NavX和双 Lasso指导下环肺静脉口外线性消融, 使肺静脉电活动与心 房电活动分离, 介绍这一手术方法治疗阵发性心房颤动(房颤)的初步经验。 方法 2004年 4月至 11 月, 共收治 22例阵发性房颤患者, 其中男性 19例, 女性 3例, 年龄 25 ～ 67(48. 5 ±11.4)岁, 房颤病史 0. 5 ～ 13.0(4. 3±3. 3)年。 3例有原发性高血压史, 余均无器质性心脏病病史。 超声心动图检查示左 心房直径为 31 ～ 46(37.5 ±4.6)mm。 所有患者在建立 EnSite-NavX左心房几何构型后, 于肺静脉开 口外 0. 5 ～ 1. 0 cm 处设置环右侧肺静脉和左侧肺静脉的环状消融线径。 盐水灌注导管沿拟定消融线 逐点消融, 完成右侧消融环线至 Lasso电极上肺静脉电位消失;再完成左侧消融环线至肺静脉电位消 失。 术后服用普罗帕酮 450 m g /d、培哚普利 4 mg /d, 共 3个月。 结果 22例患者, 除 1例术中因心包 填塞未达消融终点外 , 余 21例均达到消融终点;其中 3例于房颤节律时消融, 余 18例于窦性节律下 消融。 手术时间 5. 0 ～ 10.0 (6. 6 ±1.3) h, X线时间为 30 ～ 84(56.1 ±18. 0)m in。 随访 3 ～ 11(5.3 ± 2. 7)个月, 10例患者术后症状消失, H o lter示偶见房性早搏。 2例经再次手术后未再有房颤发作。 3 例术后 1个月内有阵发性房颤发作, 但 1 个月后未再有发作。 2 例术后仍有心悸症状, 但无房颤发 作, H o lter示频繁房性早搏, 少数组成短阵房性心动过速;3例仍有房颤发作;1例患者房颤发作更趋 频繁。 术中共 2例发生心包填塞。 本研究组总成功率为 81%。结论 EnSite-N avX和双 Lasso指导下 的左心房线性消融治疗阵发性房颤具有较高成功率, 其长期结果有待于更多病例的积累和更长时间 的随访。",
                      },
                      {
                        "title":"FOCUS超声刀开放性甲状腺切除术的临床疗效评价",
                        "author":"薛家鹏，王明华，王 耕，赵宗彬",
                        "word":"关键词：FOCUS 超声刀; 甲状腺切除术; 治疗结果",
                        "abstract":"探讨 FOCUS 超声刀开放性甲状腺切除术的临床疗效及应用价值。方法 选择 2009 年 7 月— 2011 年 5 月在我院内分泌血管外科住院手术治疗的 199 例甲状腺疾病患者作为研究对象，其中传统甲状腺切除术 ( 传 统组) 110 例，FOCUS 超声刀甲状腺切除术 ( FOCUS 超声刀组) 89 例，分别从切口大小、手术时间、术中出血量、术 后 24 h 伤口引流量、手术并发症发生率及术后住院时间进行对比分析。结果 FOCUS 超声刀组患者手术均获成功，手 术平均时间 ( 42. 33 ± 10. 72) min，术中平均出血量 ( 18. 96 ± 11. 83) ml，术后 24 h 伤口平均引流量 ( 25. 28 ± 18. 91) ml，术后平均住院时间 ( 5. 50 ± 1. 22) d，与传统组比较，差异均有统计学意义 ( P ＜ 0. 05) 。FOCUS 超声刀组术后出 血 ( 0 例) 、一过性声音嘶哑 ( 0 例) 、一过性饮水呛咳 ( 0 例) 、暂时性低钙抽搐及麻木 ( 0 例) 的发生率分别与传统 组比较，差异均有统计学意义 ( P ＜ 0. 05) 。结论 FOCUS 超声刀在甲状腺切除术中具有明显优势，其并发症少，安 全、有效，操作灵活，易于掌握，值得在今后的临床工作中予以推广。"
                      },
                      {
                        "title":"三维标测系统和单环状标测导管指示_省略_线性消融电学隔离肺静脉方法学评价",
                        "author":"董建增 马长生 刘兴鹏 龙德勇 王京 刘小青",
                        "word":"关键词：心房颤动;肺静脉;消融",
                        "abstract":"探讨三维标测系统和单环状标测导管指示下环肺静脉线性消融电学隔离肺静脉 的可行性和有效性。 方法 2004年 5月至 2004年 11月间我院对 68例症状明显、发作频繁、抗心律失 常药物治疗无效的心房颤动(房颤)患者进行了在 C arto(n =56)或 EnS ite /NavX(n =12)和单环状标测 导管指示下的环肺静脉线性消融肺静脉电隔离术。 收集操作过程中的相关数据, 计算初始肺静脉电学 隔离率、最终肺静脉电学隔离率及并发症资料。 结果 68 例患者共计完成 136个环形消融线, 操作时 间平均为(240 ±65)m in, X线曝光时间平均为(37 ±12)m in。 用于左心房重建和环肺静脉线性消融的 放电时间分别为(20 ±9)m in和(62 ±24)m in。 在完成预定环肺静脉消融线后, 初始肺静脉电学隔离率 为 50.7%(69 /136), 经寻找缝隙补充消融后最终肺静脉电学隔离率为 95. 6%(130 /136)。 70.2%(59 / 84)的缝隙分布于左侧, 29.8%(25 /84)见于右侧。 并发症包括 1例心脏压塞和 2例锁骨下及左胸部皮 下血肿, 均经保守治疗康复, 无肺静脉狭窄。 结论 三维标测系统加单环状标测导管指示下环肺静脉线 性消融电学隔离肺静脉成功率高、并发症率低, 操作时间及 X线曝光时间可以接受"
                      },
                      {
                        "title":"新型颅内支架Enterprise_省略_弹簧圈栓塞治疗颅内微小宽颈动脉瘤",
                        "author":"黄海东，赵凯，顾建文，屈延，杨涛，夏勋，林龙，张辉",
                        "word":"关键词：颅内动脉瘤；宽颈；微小；支架；Enterprise；弹簧圈；栓塞",
                        "abstract":"总结应用新型颅内支架 Enterprise 结合水解脱弹簧圈栓塞治疗颅内微小宽颈动脉 瘤的技术及疗效。 方法 6 例颅内微小宽颈动脉瘤（直径 ＜ 3 mm，体 ／ 颈比 ＜ 1．5）采用 Enterprise 支架结 合水解脱弹簧圈栓塞， 其中 5 例采用先放置支架覆盖动脉瘤颈再将微导管经支架网孔放入动脉瘤腔填 塞弹簧圈进行栓塞，1 例将微导管进入瘤腔后再释放支架进行弹簧圈栓塞。 术后 3 ～ 6 个月进行临床随 访。 结果 6 例全部技术成功，支架均满意到位，载瘤动脉通畅，无手术并发症；动脉瘤完全闭塞 4 例，闭 塞 95％以上 2 例。 术后患者均恢复良好，3 ～ 6 个月临床随访无再出血及脑血栓形成。 结论 联合使用 Enterprise 支架和水解弹簧圈栓塞治疗颅内微小宽颈动脉瘤是一种安全有效的方法， 但其长期疗效仍需 进一步观察。"
                      }
                    ],
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
