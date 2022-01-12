import 'package:flutter/material.dart';
import 'package:purple_star/screens/cart/checkout_widget.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/cart_total_value.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CheckOutWidget(),
              CartTotalWidget(),
            ],
          ),
        ),
    );
  }
}