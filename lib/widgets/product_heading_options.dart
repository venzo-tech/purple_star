import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProductHeadingAndOptions extends StatefulWidget {
  final String title;
  const ProductHeadingAndOptions({Key? key, required this.title}) : super(key: key);

  @override
  _ProductHeadingAndOptionsState createState() => _ProductHeadingAndOptionsState();
}

class _ProductHeadingAndOptionsState extends State<ProductHeadingAndOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
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
    );
  }
}
