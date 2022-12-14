class Product {
  final String id;
  final String name;
  final String price;
  final String? description; //può essere anche null, grazie al ?

  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.description, // campo non obbligatorio da passare per paramentro alla crezione dell'oggetto
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['ID'],
      name: json['Nome prodotto'],
      price: json['Prezzo'],
      description: json['Descrizione'],
    );
  }
}
