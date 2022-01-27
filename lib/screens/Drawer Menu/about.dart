import 'package:flutter/material.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/back_button.dart';

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
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//Back Button Start
            const CustomBackButton(),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
