import 'dart:io';
import 'package:flutter/material.dart';
import 'package:purple_star/screens/cart.dart';
import 'package:purple_star/screens/cart/cart_checkout_page.dart';
import 'package:purple_star/screens/sales.dart';
import 'package:purple_star/screens/menu_page.dart';

import 'home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screen = [MainHomePage(), Sales(), CheckoutScreen(), MenuPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xFF562c8A),
        currentIndex: currentIndex,
        onTap: (int index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Sales'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          )
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screen,
      ),
    );
  }
}
