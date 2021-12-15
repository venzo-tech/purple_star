import 'package:flutter/material.dart';

class Topicals extends StatefulWidget {
  const Topicals({Key? key}) : super(key: key);

  @override
  _TopicalsState createState() => _TopicalsState();
}

class _TopicalsState extends State<Topicals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 30,
          child: const TextField(
            style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              hintText: 'Search Purple Star',
              suffixIcon: Icon(Icons.search_sharp),
            ),
          ),
        ),
      ),
      body:const SingleChildScrollView(
        child: Center(child: Text('Topicals Page'),),
      ),
    );
  }
}
