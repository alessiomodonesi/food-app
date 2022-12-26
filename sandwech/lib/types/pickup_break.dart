class PickupBreak {
  final String pickup;
  final String break_;

  const PickupBreak({
    required this.pickup,
    required this.break_,
  });

  factory PickupBreak.fromJson(Map<String, dynamic> json) {
    return PickupBreak(
      pickup: json['pickup'],
      break_: json['break'],
    );
  }
}
