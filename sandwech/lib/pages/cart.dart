import 'package:flutter/material.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/utils.dart';

class CartPage extends StatefulWidget {
  final int userID;

  const CartPage(this.userID, {super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String productName = "";
  String nomeUtente = "";

  String capitalize(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  @override
  void initState() {
    super.initState();
    getUser(widget.userID.toString()).then(
        (value) => setState(() {
              nomeUtente = value.name;
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0x00000000),
          ),
          Positioned(
            width: 23,
            height: 56,
            left: 5,
            top: -28,
            child: Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFFF9B18),
            )),
          ),
          Positioned(
              width: 23,
              height: 56,
              left: 35,
              top: -15,
              child: Container(
                width: 23,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFFEE0F38)),
              )),
          Positioned(
              width: 400,
              height: 270,
              left: 20,
              top: 68,
              child: Container(
                  child: RichText(
                text: const TextSpan(
                  text: 'Ciao, ',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontFamily: 'Inter'),
                  children: <TextSpan>[
                    TextSpan(
                        text: ('Alessio'),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ))),
          GestureDetector(
              onTap: () {
                print("Test Tasto");
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFF9B18),
                    ),
                    child: Text(
                      'Conferma Ordine',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: getFontSize(30)),
                      textAlign: TextAlign.center,
                    )),
              )),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      // ignore: prefer_const_constructors
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      color: const Color.fromARGB(255, 236, 235, 235),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading:
                                Image.asset('lib/assets/icons/panini-icon.png'),
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
                  Card(
                      // ignore: prefer_const_constructors
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      color: const Color.fromARGB(255, 236, 235, 235),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading:
                                Image.asset('lib/assets/icons/panini-icon.png'),
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
      bottomNavigationBar: GNavi(2, widget.userID),
    );
  }
}
