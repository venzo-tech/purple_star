import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(13, 15, 15, 15),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.chevron_left, color: Color(0xff2d2d2d)), // icon
              Text(
                'Back',
                style: TextStyle(
                    fontFamily: 'Poppins', color: Color(0xff2d2d2d)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
