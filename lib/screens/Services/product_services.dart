import 'dart:convert';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  var URL =
      Uri.parse('https://mocki.io/v1/74d9dc9d-e33a-4fd3-b358-328d07be6aed');

  final response = await http.get(URL);

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    // print(parsed);
    var productItems =
        parsed.map<Product>((json) => Product.fromMap(json)).toList();
    return productItems;
  } else {
    throw Exception('Failed to load Products');
  }
}

Future<List<Product>> searchProduct() async {

  var URL =
  Uri.parse('https://mocki.io/v1/74d9dc9d-e33a-4fd3-b358-328d07be6aed');

  try {
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      // print(response.body);
      List<Product> list = parseAgents(response.body);
      return list;
    } else {
      throw Exception('Error');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

List<Product> parseAgents(String responseBody) {
final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
return parsed.map<Product>((json) => Product.fromMap(json)).toList();
}

// Future<List<Product>> searchProduct() async {
//   var URL = Uri.parse('https://mocki.io/v1/74d9dc9d-e33a-4fd3-b358-328d07be6aed');
//
//   final response = await http.get(URL);
//
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//     // print(parsed);
//     return parsed;
//     // return parsed.map<Product>((json) => Product.fromMap(json)).where((product){
//     //   final titleSearch = product.title.toLowerCase();
//     //   final madeSearch = product.made.toLowerCase();
//     //   final strainsSearch = product.strains.toLowerCase();
//     //   final purpleSearch = query.toLowerCase();
//     //
//     //   return titleSearch.contain(purpleSearch) || madeSearch.contain(purpleSearch) || strainsSearch.contain(purpleSearch);
//     // }).toList();
//   } else {
//     throw Exception('Failed to load Products');
//   }
// }
