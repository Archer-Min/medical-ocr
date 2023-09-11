class SearchResult {
  final int page;//第几页
  final String title;
  final String author;
  final String source;//返回“来源于文本”或“来源于图片”
  final String abstract;//摘要50字左右
  final String totalScore;//总分
  final String score1;//内容相关得分
  final String score2;//点击率得分
  final String score3;//用户反馈得分

  SearchResult({
    required this.page,
    required this.title,
    required this.author,
    required this.source,
    required this.abstract,
    required this.totalScore,
    required this.score1,
    required this.score2,
    required this.score3,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      page: json['page'],
      title: json['title'],
      author: json['author'],
      source: json['source'],
      abstract: json['abstract'],
      totalScore: json['totalScore'],
      score1: json['score1'],
      score2: json['score2'],
      score3: json['score3'],
    );
  }
}
