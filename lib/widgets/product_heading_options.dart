import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:purple_star/widgets/checkbox_filter.dart';

class ProductHeadingAndOptions extends StatefulWidget {
  final String title;
  const ProductHeadingAndOptions({Key? key, required this.title}) : super(key: key);

  @override
  _ProductHeadingAndOptionsState createState() => _ProductHeadingAndOptionsState();
}

class _ProductHeadingAndOptionsState extends State<ProductHeadingAndOptions> {
  bool pressed=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style:const TextStyle(fontSize: 30, fontFamily: 'BebasNeue'),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: InkWell(
                        onTap: () {
                          print('Filter');
                          setState(() {
                            pressed = true;
                          });
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
            pressed ? CheckBoxFilter() : SizedBox(),
          ],
        ),
      )],
    );
  }
}
