import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/age_restrict_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Color(0xFF562c8A),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF562c8A),
        ),
      ),
home: const AgeRestrictPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
