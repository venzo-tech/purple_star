import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/cart/cart_controller.dart';

class CheckOutWidget extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  CheckOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 600,
      child: ListView.builder(
          shrinkWrap:true,
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            print("controller ${controller.products.values.toList()[index]}");
            return CartCheckOutCard(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            );
          }),),);
  }
}

class CartCheckOutCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartCheckOutCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("image: ${product.productImageUrl}");
    return
       Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: 
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        product.productImageUrl,
                      ),
                    ),
                   const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(product.title),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.removeProduct(product);
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                    Text('$quantity'),
                    IconButton(
                      onPressed: () {
                        controller.addProduct(product);
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    const Text('total', style: TextStyle(fontFamily: 'BebasNeue',fontSize: 30, color: Color(0xFF562c8a)),),
                      Text('\$ ${calculateTotal(quantity).toString()}', style: TextStyle(fontFamily: 'BebasNeue',fontSize: 30,color: Color(0xFF562c8a)),),
                    ],
                  ),
                ),

              ],
            ),
          );
  }

  calculateTotal(int quantity) {
    double total = double.parse(product.price) * quantity;
    return total;
  }
}
