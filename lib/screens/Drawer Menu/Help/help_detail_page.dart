import 'package:flutter/material.dart';
import 'package:purple_star/screens/Model/help_model.dart';

class HelpDetailPage extends StatelessWidget {
  final String question;
  final String answer;

  const HelpDetailPage({Key? key, required this.question, required this.answer})
      : super(key: key);

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Back Button Start
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 15, 15, 15),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.chevron_left, color: Color(0xff2d2d2d)), // icon
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
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text(
              'Help',
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
            ),
          ),
          const Divider(
            endIndent: 40,
            height: 1,
            color: Color(0xffa3a3a3),
          ),
//Back Button End,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  answer,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),

        ]),
      ),
    );
  }
}
