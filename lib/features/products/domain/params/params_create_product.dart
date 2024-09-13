import 'dart:convert';

class ParamsCreateProduct {
  const ParamsCreateProduct({
    required this.categoryName,
    required this.name,
    required this.price,
    this.sku,
    this.description,
    this.weight,
    this.width,
    this.length,
    this.height,
    this.image,
  });

  final String categoryName;
  final String? sku;
  final String name;
  final String? description;
  final int? weight;
  final int? width;
  final int? length;
  final int? height;
  final String? image;
  final int price;

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        'categoryName': categoryName,
        'sku': sku,
        'name': name,
        'description': description,
        'weight': weight,
        'width': width,
        'length': length,
        'height': height,
        'image': image,
        'harga': price,
      };
}
