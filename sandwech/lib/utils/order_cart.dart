import 'package:flutter/material.dart';

import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/circle_button.dart';

class OrderCard extends StatefulWidget {
  final int idCategory;
  final String productName;
  final String price;
  final int quantity;

  const OrderCard(this.idCategory, this.productName, this.price, this.quantity,
      {super.key});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String tagName(int id) {
    switch (id) {
      case 1:
        return "panini";
      case 2:
        return "bibite";
      case 3:
        return "piadine";
      case 4:
        return "brioches";
      case 5:
        return "snack";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 140,
      child: Card(
        // ignore: prefer_const_constructors
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        color: const Color.fromARGB(255, 236, 235, 235),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                'lib/assets/icons/${tagName(widget.idCategory)}-icon.png',
                width: 60,
                height: 60,
              ),
              title: Text(widget.productName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFontSize(20))),
              subtitle: Text(
                "€ ${double.parse(widget.price) * widget.quantity}0",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getFontSize(18)),
              ),
              isThreeLine: false,
            ),
            Container(
                height: 32,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  color: ambratoApp,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.quantity.toString(),
                      textScaleFactor: 1.6,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
