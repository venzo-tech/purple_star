import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _showPassword = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'register',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
              ),
//Full name
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 8, 5),
                      child: Text(
                        'full name',
                        style: TextStyle(
                            color: Color(0xFF562c8A),
                            fontFamily: 'BebasNeue',
                            fontSize: 13),
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        hintText: 'John Doe',
                      ),
                    ),
                  ],
                ),
              ),
//email
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 8, 5),
                      child: Text(
                        'email',
                        style: TextStyle(
                            color: Color(0xFF562c8A),
                            fontFamily: 'BebasNeue',
                            fontSize: 13),
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        hintText: 'johndoe@email.com',
                      ),
                    ),
                  ],
                ),
              ),
//Phone number
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 8, 5),
                      child: Text(
                        'phone',
                        style: TextStyle(
                            color: Color(0xFF562c8A),
                            fontFamily: 'BebasNeue',
                            fontSize: 13),
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        hintText: '415 456 7890',
                      ),
                    ),
                  ],
                ),
              ),
// password
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 8, 5),
                      child: Text(
                        'password',
                        style: TextStyle(
                            color: Color(0xFF562c8A),
                            fontFamily: 'BebasNeue',
                            fontSize: 13),
                      ),
                    ),
                    TextField(
                      obscureText: !_showPassword,
                      style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        filled: true,
                        fillColor: const Color(0xFFf3f3f3),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        hintText: 'At least 8 characters ',
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: _showPassword
                                ? const Color(0xFF562c8A)
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => _showPassword = !_showPassword);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//checkbox
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value ?? false;
                      });
                    },
                    title: const Text(
                      'I agree to receive texts as part of Purple Star\'s loyalty and marketing program and understand consent is not required to purchase.*',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: const Color(0xFF562c8A)),
              ),
//register button
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
                              'register',
                              style: TextStyle(
                                  fontFamily: 'BebasNeue',
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ))),
//direct-> login page
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
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins', fontSize: 15,
                          color: Color(0xFFA3A3A3),
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(color: Color(0xFF297903),fontFamily: 'Poppins', fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
