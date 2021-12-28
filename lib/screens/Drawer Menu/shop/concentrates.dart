import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/Services/product_services.dart';

class Concentrates extends StatefulWidget {
  const Concentrates({Key? key}) : super(key: key);

  @override
  _ConcentratesState createState() => _ConcentratesState();
}

class _ConcentratesState extends State<Concentrates> {
  late Future<List<Product>> futureProduct;
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'concentrates',
                    style: TextStyle(fontSize: 30, fontFamily: 'BebasNeue'),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: InkWell(
                          onTap: () {
                            print('Filter');
                          },
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('Sorting');
                        },
                        child: Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: const Icon(
                              Icons.tune,
                              size: 25,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Product>>(
              future: futureProduct,
              builder: (context, snapshot) {
                // print(snapshot);
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Text(
                          'showing ' +
                              snapshot.data!.length.toString() +
                              ' results',
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 18),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            0.0), //or 15.0
                                        child: SizedBox(
                                          height: 100.0,
                                          width: 100.0,
                                          child: Image(
                                            image: NetworkImage(snapshot
                                                .data![index].productImageUrl),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].title,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins Bold',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '- ' + snapshot.data![index].made,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins Bold',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              // isExpanded: true,
                                              items: <String>[
                                                snapshot.data![index].productQty
                                                    .qty1,
                                                snapshot.data![index].productQty
                                                    .qty2,
                                                snapshot.data![index].productQty
                                                    .qty3,
                                              ].map((dropdownValue) {
                                                // print(dropdownValue);
                                                return DropdownMenuItem<String>(
                                                  value: dropdownValue,
                                                  child: Text(dropdownValue),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (String? newDropdownValue) {
                                                setState(() {
                                                  dropdownValue =
                                                      newDropdownValue;
                                                  print(dropdownValue);
                                                });
                                              },
                                              value: dropdownValue,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          InkWell(
                                            onTap: () {
                                              AddToBasket();
                                            },
                                            child: Container(
                                              width: 125,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF297903),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: const Center(
                                                  child: Text(
                                                'add to cart',
                                                style: TextStyle(
                                                    fontFamily: 'BebasNeue',
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

 AddToBasket() {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .80,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'added to basket',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    child: const Text('Proceed to checkout',
                        style:
                            TextStyle(fontFamily: 'BebasNeue', fontSize: 17)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: const Color(0xFF562c8a),
                      side: const BorderSide(
                          width: 2.0, color: Color(0xFF562c8a)),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Continue shopping',
                        style:
                            TextStyle(fontFamily: 'BebasNeue', fontSize: 17)),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
