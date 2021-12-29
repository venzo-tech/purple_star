import 'dart:convert';

List<Product> postFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

class ProductType {
  String type1;
  String type2;
  String type3;

  ProductType(this.type1, this.type2, this.type3);

  factory ProductType.fromJson(dynamic json) {
    return ProductType(json['type1'] as String, json['type2'] as String,json['type3'] as String);
  }

  @override
  String toString() {
    return '{ $type1, $type2, $type3 }';
  }
}

class Product {
  Product({
    required this.productId,
    required this.title,
    required this.made,
    required this.productImageUrl,
    required this.strains,
    required this.price,
    required this.productType,
  });

  int productId;
  String title;
  String made;
  String productImageUrl;
  String strains;
  String price;
  ProductType productType;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      productId: json["productId"],
      title: json["title"],
      made: json["made"],
      productImageUrl: json["productImageUrl"],
      strains: json["strains"],
      price: json["price"],
      productType: ProductType.fromJson(json["productType"]));
}
