import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:purple_star/screens/Drawer%20Menu/about.dart';
import 'package:purple_star/screens/Drawer%20Menu/account.dart';
import 'package:purple_star/screens/Drawer%20Menu/Blog/blog.dart';
import 'package:purple_star/screens/Drawer%20Menu/Help/help.dart';
import 'package:purple_star/screens/Drawer%20Menu/order_history.dart';
import 'package:purple_star/screens/Drawer%20Menu/settings.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/concentrates.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/accessories.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/edibles.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/flowers.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/prerolls.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/sales.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/tinctures.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/topicals.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/vape_pens.dart';

import 'package:purple_star/screens/sign_in.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  var menuItems = ['Order History','Account','Help','Blog','About','Settings','Logout', ];
  var ShopSubMenu = [
    'Concentrates',
    'Edibles',
    'Flowers',
    'Prerolls',
    'Tinctures',
    'Topicals',
    'Vape Pens',
    'Accessories',
    'Sales',
  ];

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
              child: InkWell(
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'hi, pat',
                style: TextStyle(fontSize: 30, fontFamily: 'BebasNeue'),
              ),
            ),
            const Divider(indent: 0, height: 1, color: Colors.grey),
            ExpansionTile(
              title: const Text(
                "Shop",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Colors.black,fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                for (var item in ShopSubMenu)
                  // Text(item)
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            print(item);
                            if(item == 'Concentrates'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Concentrates()),
                              );
                            }else if(item == 'Edibles'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Edibles()),
                              );
                            }else if(item == 'Flowers'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Flowers()),
                              );
                            }else if(item == 'Prerolls'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Prerolls()),
                              );
                            }else if(item == 'Tinctures'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Tinctures()),
                              );
                            }else if(item == 'Topicals'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Topicals()),
                              );
                            }else if(item == 'Vape Pens'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const VapePens()),
                              );
                            }else if(item == 'Accessories'){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const Accessories()),
                            );
                            }else  if(item == 'Sales'){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const Sales()),
                            );
                            }

                          },
                          child: ListTile(
                            trailing: const Icon(Icons.chevron_right),
                            visualDensity:
                                const VisualDensity(horizontal: 0, vertical: -4),
                            title: Text(
                              item,
                              style: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 13),
                            ),
                          ),
                        ),
                        const Divider(indent: 0, height: 1, color: Colors.grey),
                      ],
                    ),
                  ),
              ],
            ),
            const Divider(indent: 0, height: 1, color: Colors.grey),

            Column(
              children: <Widget>[
                for (var item in menuItems)
                  Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            print(item);
                            if(item == 'Order History'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const OrderHistory()),
                              );
                            }else if(item == 'Account'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Account()),
                              );
                            }else if(item == 'Help'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Help()),
                              );
                            }else if(item == 'Blog'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Blog()),
                              );
                            }else if(item == 'About'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const About()),
                              );
                            }else if(item == 'Settings'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>const Settings()),
                              );
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
                        const Divider(indent: 0, height: 1, color: Color(0xffa3a3a3)),
                      ],
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
