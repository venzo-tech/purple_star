import 'package:flutter/material.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/Services/product_services.dart';

class Concentrates extends StatefulWidget {
  const Concentrates({Key? key}) : super(key: key);

  @override
  _ConcentratesState createState() => _ConcentratesState();
}

class _ConcentratesState extends State<Concentrates> {
  late Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
    // print(futureProduct.toString());
  }

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
      body: FutureBuilder<List<Product>>(
          future: futureProduct,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97FFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].title}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].productQty.qty1}"),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
    );
  }
}


