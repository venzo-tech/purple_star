import 'package:flutter/material.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/Services/product_services.dart';
import 'package:purple_star/screens/cart/add_to_basket.dart';
import 'package:purple_star/screens/product_detail_page.dart';
import 'package:purple_star/widgets/custom_dropdown_button.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  late Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
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
                  'showing ' + snapshot.data!.length.toString() + ' results',
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 18),
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
                  itemBuilder: (_, index) {
                    List<String> selectedItemValue = <String>[
                      ("\$${snapshot.data![index].price} ${snapshot.data![index].productType.type1}"),
                      ("\$${snapshot.data![index].price} ${snapshot.data![index].productType.type2}"),
                      ("\$${snapshot.data![index].price} ${snapshot.data![index].productType.type3}")
                    ];
                    final defaultValue = selectedItemValue[0];
                    return InkWell(
                      onTap: () {
                        // print(snapshot.data![index].productImageUrl);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                      child: Column(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(0.0), //or 15.0
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
                                        CustomDropdownMenu(
                                            defaultValue: defaultValue,
                                            values: selectedItemValue,
                                            onItemSelected: (value) {
                                              print("Selected Item : $value");
                                            }),
                                        const SizedBox(height: 10),
                                        InkWell(
                                          onTap: () {
                                            AddToBasket(
                                                context, snapshot.data![index]);
                                          },
                                          child: Container(
                                            width: 125,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF297903),
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
                    );
                  }),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
