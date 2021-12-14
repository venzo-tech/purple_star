import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Sign In',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'phone or email',
                    style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 12,
                        color: Color(0xFF562c8A)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    style: TextStyle(
                        fontFamily: 'Poppins', fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                      filled: true,
                      fillColor: Color(0xFFf3f3f3),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      hintText: 'ex: johndoe@email.com',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'password',
                    style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 12,
                        color: Color(0xFF562c8A)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                        fontFamily: 'Poppins', fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                      filled: true,
                      fillColor: Color(0xFFf3f3f3),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: InkWell(
                        onTap: () {
                          print('Sign In Button Pressed');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF562c8A),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Center(
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        print('Sign Up Pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Register()),
                        );
                      },
                      // child: const Text('Not a Member? Sign Up'),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 15,
                            color: Color(0xFFA3A3A3),
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Not a Member? '),
                            TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(color: Color(0xFF297903),fontFamily: 'Poppins', fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
