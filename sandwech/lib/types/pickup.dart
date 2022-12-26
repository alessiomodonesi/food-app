class Pickup {
  final String id;
  final String name;

  const Pickup({
    required this.id,
    required this.name,
  });

  factory Pickup.fromJson(Map<String, dynamic> json) {
    return Pickup(
      id: json['id'],
      name: json['name'],
    );
  }
}
