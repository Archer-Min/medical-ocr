class SearchAbs {
  final String msg;
  final String data;


  SearchAbs({
    required this.msg,
    required this.data,
  });

  factory SearchAbs.fromJson(Map<String, dynamic> json) {
    return SearchAbs(
      msg: json['msg'],
      data: json['data'],
    );
  }

}