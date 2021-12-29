import 'dart:convert';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  var URL = Uri.parse('https://mocki.io/v1/74d9dc9d-e33a-4fd3-b358-328d07be6aed');

  final response = await http.get(URL);

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    // print(parsed);
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load Products');
  }
}