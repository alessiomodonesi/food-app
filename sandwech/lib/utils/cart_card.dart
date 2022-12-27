import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandwech/utils/utils.dart';

import '../types/user.dart';

class CartCard extends StatefulWidget {
  final int idCategory;
  final String productName;
  final String price;
  final String? quantity;
  final String productId;
  final User userData;

  const CartCard(this.idCategory, this.productName, this.price, this.quantity,
      this.productId, this.userData,
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
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                color: ambratoApp,
                border: Border.all(color: Colors.white, width: 2),
              ),
              /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // minus button
                    ButtonCircle(25, ambratoApp, CupertinoIcons.minus,
                        Alignment.center, Colors.white, () {
                      setState(() {
                        if (quant > 1) {
                          quant--;
                          setCartItemremove(
                                  widget.userData.id, widget.productId)
                              .then((value) => log(value));
                        }
                      });
                    }),
                    const SizedBox(
                      width: 10,
                    ),

                    // quant text
                    Text(
                      quant.toString(),
                      textScaleFactor: 1.6,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    // plus button
                    ButtonCircle(25, ambratoApp, CupertinoIcons.plus,
                        Alignment.center, Colors.white, () {
                      setState(
                        () {
                          if (quant < 99) {
                            quant++;
                            setCartItemAdd(widget.userData.id, widget.productId)
                                .then((value) => log(value));
                          }
                        },
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),

                    // trash button
                    ButtonCircle(25, Colors.white, CupertinoIcons.trash,
                        Alignment.center, ambratoApp, () {
                      setState(
                        () {
                          if (quant < 99) {
                            quant = 0;
                            deleteCartItem(widget.userData.id, widget.productId)
                                .then((value) => log(value));
                          }
                        },
                      );
                    })
                  ],
                )),*/
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 28,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      //color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        // minus button
                        ButtonCircle(25, ambratoApp, CupertinoIcons.minus,
                            Alignment.center, Colors.white, () {
                          setState(() {
                            if (quant > 1) {
                              quant--;
                            }
                          });
                        }),
                        Text(
                          quant.toString(),
                          textScaleFactor: 1.5,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        // plus button
                        ButtonCircle(25, ambratoApp, CupertinoIcons.plus,
                            Alignment.center, Colors.white, () {
                          setState(() {
                            if (quant < 99) {
                              quant++;
                            }
                          });
                        }),
                        const SizedBox(
                          width: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // trash button
                  ButtonCircle(30, Colors.white, CupertinoIcons.trash,
                      Alignment.center, ambratoApp, () {
                    setState(
                      () {
                        if (quant < 99) {
                          quant = 0;
                          deleteCartItem(widget.userData.id, widget.productId)
                              .then((value) => log(value));
                        }
                      },
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
