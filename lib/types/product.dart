class Product {
  final String id;
  final String name;
  final String price;
  final String description;
  final String quantity;
  final String nutritional_value;
  final String active;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.nutritional_value,
    required this.active,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      quantity: json['quantity'],
      nutritional_value: json['nutritional_value'],
      active: json['active'],
    );
  }
}
