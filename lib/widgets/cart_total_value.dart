import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/cart/cart_controller.dart';

class CartTotalWidget extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Obx(
        () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller.total == null ? totalValue(0) : totalValue(controller.total),
          ],
        )),
  );
  }

  totalValue(total) {
    return Text(
      '\$$total',
      style:const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}