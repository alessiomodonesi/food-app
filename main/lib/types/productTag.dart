class ProductTag {
  final String product;
  final String tag;

  const ProductTag({
    required this.product,
    required this.tag,
  });

  factory ProductTag.fromJson(Map<String, dynamic> json) {
    return ProductTag(
      product: json['product'],
      tag: json['tag'],
    );
  }
}
