import 'package:flutter/material.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';

class ProductDetailPage extends StatelessWidget {

  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
    );
  }
}
