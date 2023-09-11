class SearchDoc {
  final String fileName;
  final String data;


  SearchDoc({
    required this.fileName,
    required this.data,
  });

  factory SearchDoc.fromJson(Map<String, dynamic> json) {
    return SearchDoc(
      fileName: json['fileName'],
      data: json['data'],
    );
  }

}