class LikeRecord {
  final String title;
  final String author;
  final String date;

  LikeRecord({
    required this.title,
    required this.author,
    required this.date,
  });

  factory LikeRecord.fromJson(Map<String, dynamic> json) {
    return LikeRecord(
        title: json['title'],
        author: json['author'],
        date: json['date']
    );
  }
}
