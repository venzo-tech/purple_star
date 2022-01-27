import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/back_button.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  var accOptions = ['Request my data', 'Delete account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            //Back Button
            const CustomBackButton(),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
              child: Text(
                'Account',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
              ),
            ),
            const Divider(
              endIndent: 40,
              height: 1,
              color: Color(0xffa3a3a3),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Name: ', style: TextStyle(fontFamily: 'Poppins', fontSize: 15),),
                      Text('Pat Smitty', style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email: ', style: TextStyle(fontFamily: 'Poppins', fontSize: 15),),
                      Text('psmitty@hotmail.com', style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Phone Number: ', style: TextStyle(fontFamily: 'Poppins', fontSize: 15),),
                      Text('(415)555-4152', style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700),),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 40,
              height: 1,
              color: Color(0xffa3a3a3),
            ),
            for (var item in accOptions)
            InkWell(
              onTap: (){
                print(item);
                if(item == 'Request my data'){
                  // Get.to(() => const OrderHistory());
                }else if(item == 'Delete account'){
                  // Get.to(() =>const Account());
                }
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
          ],
        ),
      ),
    );
  }
}
