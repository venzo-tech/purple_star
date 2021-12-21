import 'package:flutter/material.dart';
import 'package:purple_star/screens/Model/category_model.dart';
import 'package:purple_star/screens/deals_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

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
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
                child: Text('purple star deals', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),),
              ),
              Container(
                height: 200,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                 const Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
                    child: Text('shop by category', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28),),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          children: List.generate(category.length, (index) {
                            return Center(
                              child: SelectCategory(categoryModel: category[index]),
                            );
                          }
                          ),
                      ),
                  ),
                ],
              )
            ],
      ),
        ),
    );
  }
}
