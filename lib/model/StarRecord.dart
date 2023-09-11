class StarRecord {
  final String title;
  final String author;
  final String date;

  StarRecord({
    required this.title,
    required this.author,
    required this.date,
  });

  factory StarRecord.fromJson(Map<String, dynamic> json) {
    return StarRecord(
        title: json['title'],
        author: json['author'],
        date: json['date']
    );
  }
}
