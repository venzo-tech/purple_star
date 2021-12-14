import 'package:flutter/material.dart';
import 'package:purple_star/screens/sign_in.dart';
import 'register.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Page')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          child: const Text('Sign In', style: TextStyle(fontSize: 15),),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ),
    );
  }
}
