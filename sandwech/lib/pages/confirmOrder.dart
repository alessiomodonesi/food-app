import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sandwech/types/break.dart';
import 'package:sandwech/types/pickup.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/user.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/order_cart.dart';
import 'package:sandwech/utils/circle_button.dart';
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
  List<Pickup> _pickupList = List.empty();
  final List<Break> _breakList = List.empty(growable: true);
  Pickup pickupPlace = Pickup(id: "", name: "");
  Break breakTime = Break(id: "", time: "");
  String jsonOrder = "";

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

  EdgeInsets getMarginDevice(double android, double ios) {
    if (Platform.isAndroid) {
      return EdgeInsets.only(bottom: android);
    } else if (Platform.isIOS) {
      return EdgeInsets.only(bottom: ios);
    }
    return const EdgeInsets.only(top: 0);
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

    getPickupZones().then(
        (value) => setState(() {
              _pickupList = value;
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
                top: 170,
                child: Material(
                  color: Colors.white,
                  child: Center(
                    child: DropdownButton(
                      hint: Text(pickupPlace.name),
                      elevation: 16,
                      style: const TextStyle(color: rossoApp),
                      underline: Container(
                        height: 2,
                        color: rossoApp,
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      items: _pickupList.map((pickup) {
                        return DropdownMenuItem(
                          value: pickup,
                          child: Text(pickup.name),
                        );
                      }).toList(),
                      onChanged: (pickup) {
                        // This is called when the user selects an item.
                        setState(() {
                          pickupPlace = pickup!;
                        });
                        _breakList.clear();

                        getPickupIdBreak(pickup!.id).then((value) => {
                              for (var record in value)
                                {
                                  getBreak(record.break_).then((value) => {
                                        for (var bbreak in value)
                                          {
                                            setState(() {
                                              _breakList.add(bbreak);
                                              breakTime =
                                                  Break(id: "", time: "");
                                            }),
                                          }
                                      }),
                                },
                            });
                      },
                    ),
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
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 30)) /
                    2,
                width: (MediaQuery.of(context).size.width) - 30,
                top: 305,
                child: Material(
                  color: Colors.white,
                  child: Center(
                    child: DropdownButton(
                      hint: Text(breakTime.time),
                      elevation: 16,
                      style: const TextStyle(color: ambratoApp),
                      underline: Container(
                        height: 2,
                        color: ambratoApp,
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      items: _breakList.map((bbreak) {
                        return DropdownMenuItem(
                          value: bbreak,
                          child: Text(bbreak.time),
                        );
                      }).toList(),
                      onChanged: (bbreak) async {
                        // This is called when the user selects an item.
                        setState(() {
                          breakTime = bbreak!;
                        });
                      },
                    ),
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
            GestureDetector(
                onTap: () {
                  if (breakTime.time.isNotEmpty &&
                      pickupPlace.name.isNotEmpty) {
                    jsonOrder = '''
                        {
                          "user_ID": ${widget.userData.id}
                          "total_price": "10"
                          "break_ID": ${breakTime.id}
                          "pickup_ID": ${pickupPlace.id}
                          "products": [
                            {"name": "panino al prosciutto"}
                          ]
                        }
                        ''';
                    log(jsonOrder);
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmOrderWidget(
                                widget.userData,
                              )));*/
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Errore, seleziona un punto di ritiro e/o l'orario")));
                  }
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: getMarginDevice(0, 50),
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 158, 11, 0),
                      ),
                      child: Text(
                        'Ordina',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: getFontSize(24)),
                        textAlign: TextAlign.center,
                      )),
                )),
          ],
        ),
        bottomNavigationBar: GNavi(2, widget.userData));
  }
}
