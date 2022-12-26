class Break {
  final String id;
  final String time;

  const Break({
    required this.id,
    required this.time,
  });

  factory Break.fromJson(Map<String, dynamic> json) {
    return Break(
      id: json['id'],
      time: json['time'],
    );
  }
}
