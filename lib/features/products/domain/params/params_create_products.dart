import 'dart:convert';

class ParamsCreateProducts {
  const ParamsCreateProducts({
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.price,
  });

  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final int weight;
  final int width;
  final int length;
  final int height;
  final String image;
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
        'price': price,
      };
}
