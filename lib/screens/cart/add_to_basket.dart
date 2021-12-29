import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/cart/cart_page.dart';

Future<void> AddToBasket( BuildContext context,Product product) async {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .70,
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
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          0.0), //or 15.0
                      child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image(
                          image: NetworkImage(product.productImageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title),
                          Text('-'+product.made),
                        ],
                      ),
                    ),
                  ],
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartProductPage()),
                      );
                    },
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