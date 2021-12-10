import 'dart:async';

import 'package:flutter/material.dart';
import 'package:purple_star/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllowNotificationPage extends StatefulWidget {
  const AllowNotificationPage({Key? key}) : super(key: key);

  @override
  _AllowNotificationPageState createState() => _AllowNotificationPageState();
}

class _AllowNotificationPageState extends State<AllowNotificationPage> {
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
            MaterialPageRoute(builder: (context) => NotificationScreen()))
            : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationScreen();
  }
}


// ignore: use_key_in_widget_constructors
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/homeBG.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.85,
                    // height: MediaQuery.of(context).size.width * 0.9,
                    // color: Colors.orange,
                    alignment: Alignment.center, // where to position the child
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/image/psmd_logo.jpg"),
                              // fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
                        child: Text(
                          'Purple Star uses notifications to help you stay on top of:',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\u2022 Lates deals\n\u2022 Personalised offers\n\u2022 Expiry reminders, and more',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                        child: InkWell(
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: const BoxDecoration(
                                color: Color(0xFF562c8A),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            child: const Center(
                                child: Text(
                                  'allow',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'BebasNeue',
                                    fontSize: 20,
                                  ),
                                )),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: InkWell(
                          child: const Center(
                            child: Text(
                              'not yet',
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>const HomePage()),
                            );
                          },
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}