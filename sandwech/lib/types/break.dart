class Break {
  final String time;

  const Break({
    required this.time,
  });

  factory Break.fromJson(Map<String, dynamic> json) {
    return Break(
      time: json['time'],
    );
  }
}
