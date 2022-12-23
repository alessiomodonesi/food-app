import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/user.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/order_cart.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:sandwech/utils/catalog_card.dart';
import 'package:sandwech/pages/product.dart';

class ConfirmOrderWidget extends StatefulWidget {
  final User userData;

  const ConfirmOrderWidget(this.userData, {super.key});

  @override
  State<ConfirmOrderWidget> createState() => _ConfirmOrderWidgetState();
}

class _ConfirmOrderWidgetState extends State<ConfirmOrderWidget> {
  String catalogName = "";
  List<Product> _productList = List.empty(growable: true);

  int debugUserID = 4;

  String capitalize(String str) {
    return str[0].toUpperCase() + str.substring(1);
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

  EdgeInsets getPaddingDevice() {
    if (Platform.isAndroid) {
      return const EdgeInsets.only(
        top: 400,
        left: 14,
        right: 14,
      );
    } else if (Platform.isIOS) {
      return const EdgeInsets.only(
        top: 150,
        left: 14,
        right: 14,
      );
    }
    return const EdgeInsets.only(
      top: 0,
      left: 0,
      right: 0,
    );
  }

  @override
  void initState() {
    super.initState();

    getCart(widget.userData.id.toString()).then(
        (value) => setState(() {
              _productList = value;
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
            ),
            Positioned(
              top: 65,
              left: 10,
              child: ButtonCircle(30, Colors.white, Icons.arrow_back_ios,
                  Alignment.centerRight, Colors.black, () {
                Navigator.pop(context);
              }),
            ),
            Positioned(
                width: 23,
                height: 56,
                left: 5,
                top: -28,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ambratoApp),
                )),
            Positioned(
                width: 23,
                height: 56,
                left: 35,
                top: -15,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: rossoApp),
                )),
            Positioned(
                width: 400,
                height: 270,
                left: 40,
                top: 68,
                child: Container(
                    child: RichText(
                  text: TextSpan(
                    text: 'Ciao, ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontFamily: 'Inter'),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.userData.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ))),
            Positioned(
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 30)) /
                    2,
                width: (MediaQuery.of(context).size.width) - 30,
                top: 130,
                child: const Material(
                  color: Colors.white,
                  child: Center(
                    child: Text('Seleziona punto di Ritiro'),
                  ),
                )),
            Positioned(
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 30)) /
                    2,
                width: (MediaQuery.of(context).size.width) - 30,
                top: 250,
                child: const Material(
                  color: Colors.white,
                  child: Center(
                    child: Text('Seleziona orario di Ritiro'),
                  ),
                )),
            Positioned(
                width: MediaQuery.of(context).size.width,
                height: 24,
                top: 400,
                child: Container(
                    child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Il mio ordine",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontFamily: 'Inter',
                    ),
                  ),
                ))),
            Container(
                padding: getPaddingDevice(),
                child: (() {
                  if (_productList.isEmpty) {
                    return Center(
                        child: RichText(
                      text: const TextSpan(
                        text: ("Nessun prodotto"),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        int.parse(_productList[index].id),
                                        widget.userData)));
                          },
                          child: OrderCard(
                            int.parse(_productList[index].tagID.toString()),
                            _productList[index].name,
                            _productList[index].price,
                            int.parse(_productList[index].quantity.toString()),
                          ),
                        );
                      },
                    );
                  }
                }())),
          ],
        ),
        bottomNavigationBar: GNavi(2, widget.userData));
  }
}
