import 'package:flutter/material.dart';

import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:flutter/cupertino.dart';

class CartCard extends StatefulWidget {
  final int idCategory;
  final String productName;
  final String price;
  final String? quantity;

  const CartCard(this.idCategory, this.productName, this.price, this.quantity,
      {super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int quant = 0;

  @override
  void initState() {
    super.initState();
    quant = int.parse(widget.quantity as String);
  }

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
                "€ ${widget.price}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getFontSize(18)),
              ),
              isThreeLine: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonCircle(30, const Color(0xFFECEBEB), CupertinoIcons.minus,
                    Alignment.center, Colors.black, () {
                  setState(
                    () {
                      if (quant > 1) {
                        quant--;
                      }
                    },
                  );
                }),
                Text(
                  quant.toString(),
                  textScaleFactor: 1.6,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                ButtonCircle(30, const Color(0xFFECEBEB), CupertinoIcons.plus,
                    Alignment.center, Colors.black, () {
                  setState(
                    () {
                      if (quant < 99) {
                        quant++;
                      }
                    },
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
