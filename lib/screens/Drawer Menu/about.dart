import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  var aboutItems = ['Privacy Policy','Terms of Use' ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//Back Button Start
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const [
                     Icon(Icons.chevron_left,color: Color(0xff2d2d2d)), // icon
                     Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Poppins', color: Color(0xff2d2d2d)),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 40),
              child: Text('About', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),),
            ),
           const Divider(
              endIndent: 40, height: 1,
              color: Color(0xffa3a3a3),
            ),
//Back Button End
            Column(
              children: <Widget>[
                for (var item in aboutItems)
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          print(item);
                        },
                        child: ListTile(
                          trailing: const Icon(Icons.chevron_right),
                          title: Text(
                            item,
                            style:const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Divider(indent: 0, height: 1, color: Color(0xffa3a3a3)),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 50,),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Version 1.0.0',style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  color: Colors.black, fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }
}
