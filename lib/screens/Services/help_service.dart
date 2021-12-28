import 'dart:convert';
import 'package:purple_star/screens/Model/help_model.dart';
import 'package:http/http.dart' as http;

Future<List<HelpModel>> fetchHelp() async {
  var URL = Uri.parse('https://mocki.io/v1/aaedf647-f90a-4eae-831c-8af048d59df4');

  final response = await http.get(URL);

  if (response.statusCode == 200) {
    // print(response.body);
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<HelpModel>((json) => HelpModel.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load Help');
  }
}