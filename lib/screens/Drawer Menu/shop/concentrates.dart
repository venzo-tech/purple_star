import 'package:flutter/material.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/product_heading_options.dart';
import 'package:purple_star/widgets/product_list_view.dart';

class Concentrates extends StatefulWidget {
  final String pageTitle;

  const Concentrates({Key? key, required this.pageTitle,}) : super(key: key);

  @override
  _ConcentratesState createState() => _ConcentratesState();
}

class _ConcentratesState extends State<Concentrates> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductHeadingAndOptions(title: widget.pageTitle,),
           const ProductListView(),
          ],
        ),
      ),
    );
  }
}
