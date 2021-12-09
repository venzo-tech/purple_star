import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class AgeRestrictPage extends StatefulWidget {
  const AgeRestrictPage({Key? key}) : super(key: key);

  @override
  _AgeRestrictPageState createState() => _AgeRestrictPageState();
}

class _AgeRestrictPageState extends State<AgeRestrictPage> {
  Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isFirstTime = prefs.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      prefs.setBool('first_time', false);
      return false;
    } else {
      prefs.setBool('first_time', false);
      return true;
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      isFirstTime().then((isFirstTime) {
        isFirstTime
            ? Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => IntroScreen()))
            : Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/homeBG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
         Center(
           child: Container(
             child:const Text('Text'),
           ),
         ),
      ],
    );
  }
}
