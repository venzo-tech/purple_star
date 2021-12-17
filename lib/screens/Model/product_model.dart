import 'dart:convert';

List<Product> postFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

class ProductQty {
  String qty1;
  String qty2;
  String qty3;

  ProductQty(this.qty1, this.qty2, this.qty3);

  factory ProductQty.fromJson(dynamic json) {
    return ProductQty(json['qty1'] as String, json['qty2'] as String,json['qty3'] as String);
  }

  @override
  String toString() {
    return '{ $qty1, $qty2, $qty3 }';
  }
}

class Product {
  Product({
    required this.productId,
    required this.title,
    required this.made,
    required this.productImageUrl,
    required this.productQty,
  });

  int productId;
  String title;
  String made;
  String productImageUrl;
  ProductQty productQty;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      productId: json["productId"],
      title: json["title"],
      made: json["made"],
      productImageUrl: json["productImageUrl"],
      productQty: ProductQty.fromJson(json["productQty"]));
}

// class ProductQty {
//   ProductQty({
//     required this.qty1, required this.qty2, required this.qty3,
//   });
//
//   var qty1;
//   var qty2;
//   var qty3;
//
//   factory ProductQty.fromMap(Map<String, dynamic> json) {
//     return ProductQty(
//       qty1: json["qty1"],
//       qty2: json["qty2"],
//       qty3: json["qty3"],
//     );
//   }
// }

