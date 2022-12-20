import 'package:flutter/material.dart';
import 'package:sandwech/utils/GNav.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Carrello"),
      ),
      bottomNavigationBar: GNavi(1),
    );
  }
}
