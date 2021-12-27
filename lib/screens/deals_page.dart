import 'package:flutter/material.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({Key? key}) : super(key: key);

  @override
  _DealsPageState createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Center(
                child: Image(
              image: AssetImage('assets/image/deals_4.jpeg'),
              height: 350,
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Text(
                'Saturday concentrate deals - \n#purplestar',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 22),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                'Check all the great produce placeholder text hear to keep this up to date with all info for product. Check all the great product placeholder text here to keep this up to date with all info for product.',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
