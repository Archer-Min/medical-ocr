class HistoryRecord {
  final String title;
  final String author;
  final String date;

  HistoryRecord({
    required this.title,
    required this.author,
    required this.date,
  });

  factory HistoryRecord.fromJson(Map<String, dynamic> json) {
    return HistoryRecord(
      title: json['title'],
      author: json['author'],
      date: json['date']
    );
  }
}
