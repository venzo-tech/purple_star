import 'package:flutter/material.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/concentrates.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/accessories.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/edibles.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/flowers.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/prerolls.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/sales.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/tinctures.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/topicals.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/vape_pens.dart';
import 'package:purple_star/screens/deals_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var category = [
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
      appBar:AppBar(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 15, 10),
            child: Text('purple star deals', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),),
          ),
          Container(
            height: 250,
            margin:const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DealsPage()),
                      );
                    },
                    child: Container(
                      margin:const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:const Image(image: AssetImage('assets/image/deals_4.jpeg'),height: 200,width: 200,fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:const Image(image: AssetImage('assets/image/deals_2.jpeg'),height: 200,width: 200,fit: BoxFit.cover,),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:const Image(image: AssetImage('assets/image/deals_1.jpeg'),height: 200,width: 200,fit: BoxFit.cover,),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:const Image(image: AssetImage('assets/image/deals_3.jpeg'),height: 200,width: 200,fit: BoxFit.cover,),
                    ),
                  ),
                ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 15, 10),
                child: Text('shop by category', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),),
              ),
              // for (var item in category)
              // // Text(item)
              //   Padding(
              //     padding: const EdgeInsets.only(left: 40),
              //     child: Column(
              //       children: <Widget>[
              //         InkWell(
              //           onTap: (){
              //             print(item);
              //             if(item == 'Concentrates'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) => const Concentrates()),
              //               );
              //             }else if(item == 'Edibles'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Edibles()),
              //               );
              //             }else if(item == 'Flowers'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Flowers()),
              //               );
              //             }else if(item == 'Prerolls'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Prerolls()),
              //               );
              //             }else if(item == 'Tinctures'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Tinctures()),
              //               );
              //             }else if(item == 'Topicals'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Topicals()),
              //               );
              //             }else if(item == 'Vape Pens'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const VapePens()),
              //               );
              //             }else if(item == 'Accessories'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Accessories()),
              //               );
              //             }else  if(item == 'Sales'){
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) =>const Sales()),
              //               );
              //             }
              //
              //           },
              //           child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //               maxCrossAxisExtent: 200,
              //               childAspectRatio: 3 / 2,
              //               crossAxisSpacing: 20,
              //               mainAxisSpacing: 20),itemCount: category.length,
              //             itemBuilder: (BuildContext context, int index){
              //             return Container(
              //               alignment: Alignment.center,
              //               child: Text(category[index]),
              //               decoration: BoxDecoration(
              //                   color: Colors.amber,
              //                   borderRadius: BorderRadius.circular(15)),
              //             );
              //             },
              //
              //           ),
              //
              //           // ListTile(
              //           //   trailing: const Icon(Icons.chevron_right),
              //           //   visualDensity:
              //           //   const VisualDensity(horizontal: 0, vertical: -4),
              //           //   title: Text(
              //           //     item,
              //           //     style: const TextStyle(
              //           //         fontFamily: 'Poppins', fontSize: 13),
              //           //   ),
              //           // ),
              //         ),
              //
              //       ],
              //     ),
              //   ),
            ],
          )
        ],
      ),
    );
  }
}
