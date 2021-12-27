import 'dart:convert';
import 'package:purple_star/screens/Model/blog_model.dart';
import 'package:http/http.dart' as http;

Future<List<BlogPost>> fetchBlog() async {
  var URL = Uri.parse('https://mocki.io/v1/7c3b9669-8502-48eb-bde3-752924604407');

  final response = await http.get(URL);

  if (response.statusCode == 200) {
    // print(response.body);
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<BlogPost>((json) => BlogPost.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load Blog');
  }
}