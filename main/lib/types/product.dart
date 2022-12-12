class Product {
  final String id;
  final String name;
  final String price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['ID'],
      name: json['Nome prodotto'],
      price: json['Prezzo'],
    );
  }
}
