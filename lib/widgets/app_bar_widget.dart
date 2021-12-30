import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(55);

  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 30,
        child: const TextField(
          style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            hintText: 'Search Purple Star',
            suffixIcon: Icon(Icons.search_sharp),
          ),
        ),
      ),
    );
  }
}
