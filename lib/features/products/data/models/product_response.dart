import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  const ProductResponse({
    this.id,
    this.productResponseId,
    this.categoryId,
    this.categoryName,
    this.sku,
    this.name,
    this.description,
    this.weight,
    this.width,
    this.length,
    this.height,
    this.image,
    this.price,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'id')
  final int? productResponseId;
  @JsonKey(name: 'CategoryId')
  final int? categoryId;
  @JsonKey(name: 'categoryName')
  final String? categoryName;
  @JsonKey(name: 'sku')
  final String? sku;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'weight')
  final int? weight;
  @JsonKey(name: 'width')
  final int? width;
  @JsonKey(name: 'length')
  final int? length;
  @JsonKey(name: 'height')
  final int? height;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'harga')
  final int? price;

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
