import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: const <Widget>[
          Text('register', style: TextStyle(fontFamily: 'BebasNeue'),)
          ],
      ),

    );
  }
}
