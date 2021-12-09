import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Center(
            child: SingleChildScrollView(
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 40),
              child: Container(
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
                  const Text(
                    'Cannabis Dispensary',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
                    child: Text(
                      'You must be at least 21 years of age to view this app.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
                    child: Text(
                      'By accessing this app, you accept the Terms of Use and Privacy Policy.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                    child: InkWell(
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: const Center(
                            child: Text(
                          'i\'m at least 21 years old',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BebasNeue',
                            fontSize: 20,
                          ),
                        )),
                      ),
                      onTap: () {
                        print('container');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: InkWell(
                      child: const Center(
                        child: Text(
                          'i\'m not 21 yet',
                          style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        print('i\'m not 21 yet');
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
