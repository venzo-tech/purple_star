import 'package:flutter/material.dart';
import 'package:purple_star/screens/cart/checkout_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Column(
        children: [
          CheckOutWidget(),
          // CartTotal(),
        ],
      ),
    );
  }
}