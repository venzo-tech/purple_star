import 'package:flutter/material.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/back_button.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppBarWidget(),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Back Button
            const CustomBackButton(),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
              child: Text(
                'settings',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
              ),
            ),
            const Divider(
              endIndent: 40,
              height: 1,
              color: Color(0xffa3a3a3),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Face ID Setting', style: TextStyle(fontFamily: 'Poppins',fontSize: 15),),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Push Notification', style: TextStyle(fontFamily: 'Poppins',fontSize: 15),),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
