class Ingredient {
  final String name;
  final String description;

  const Ingredient({
    required this.name,
    required this.description,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      description: json['description'],
    );
  }
}
