import 'package:flutter/material.dart';

class CheckBoxFilter extends StatefulWidget {

  const CheckBoxFilter({Key? key}) : super(key: key);

  @override
  _CheckBoxFilterState createState() => _CheckBoxFilterState();
}

class _CheckBoxFilterState extends State<CheckBoxFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),

      ],
    );
  }
}
