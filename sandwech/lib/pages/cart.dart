// import 'package:flutter/material.dart';
// import 'package:sandwech/utils/GNav.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Carrello"),
//       ),
//       bottomNavigationBar: GNavi(1),
//     );
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:sandwech/pages/product.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/product_tag.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandwech/utils/GNav.dart';

class CartPage extends StatefulWidget {
  // final int userID;
  // const CartPage(this.userID, {super.key});
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String productName = "";

  String capitalize(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getCartProduct(widget.userID.toString()).then(
  //       (value) => setState(() {
  //             productName = capitalize(value[0].name);
  //           }), onError: (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Sending Message"),
  //     ));
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0x00000000),
          ),
          Positioned(
            top: 40,
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
            top: -31,
            child: Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFFF9B18),
            )),
          ),
          Positioned(
              width: 400,
              height: 270,
              left: 24,
              top: 70,
              child: Container(
                  child: RichText(
                // ignore: prefer_const_constructors
                text: TextSpan(
                  text: 'Ciao, ecco il tuo ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontFamily: 'Inter'),
                  children: <TextSpan>[
                    TextSpan(
                        text: ('carrello'),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ))),
          Positioned(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFFFF9B18),
                )),
          )),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 236, 235, 235),
                    ),
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    // child: const Center(
                    //     child: Text(
                    //   'test',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //   ),
                    // )),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset('lib/assets/sandwich.png'),
                          title: Center(
                              child: Text(
                            'PANINO',
                          )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 236, 235, 235),
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Center(
                        child: Text(
                      'test',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ),
                  Card(
                      // ignore: prefer_const_constructors
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      color: const Color.fromARGB(255, 236, 235, 235),
                      child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading: Image.asset('lib/assets/sandwich.png'),
                            title: Text('Panino al Salame',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(20))),
                            subtitle: Text(
                              '€ 2,00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(18)),
                            ),
                            isThreeLine: false,
                          ))),
                ],
              ))
        ],
      ),
      bottomNavigationBar: GNavi(2),
    );
  }
}
