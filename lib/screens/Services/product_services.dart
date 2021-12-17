import 'dart:convert';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  var URL = Uri.parse('https://mocki.io/v1/697e4dbb-7c67-4c3a-8f95-23a3a37810ed');

  final response = await http.get(URL);

  if (response.statusCode == 200) {
    // print(response.body);
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}