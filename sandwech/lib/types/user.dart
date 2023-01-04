class User {
  late int id;
  final String name;
  final String surname;
  final String email;

  User({
    required this.name,
    required this.surname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
    );
  }
}
