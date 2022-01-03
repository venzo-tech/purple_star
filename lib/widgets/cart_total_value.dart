import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/cart/cart_controller.dart';

class CartTotalWidget extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotalWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    print('Subtotal: ${controller.productSubtotal}');
    print(controller.total);
    return Obx(
          () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text(
                'Total',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${controller.total}',
                style:const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
    );
  }
}