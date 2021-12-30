import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/product_list_view.dart';

class Concentrates extends StatefulWidget {
  const Concentrates({Key? key}) : super(key: key);

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
           const ProductListView(),
          ],
        ),
      ),
    );
  }
}
