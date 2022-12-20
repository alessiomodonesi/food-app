import 'package:flutter/material.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/cart_card.dart';
import 'package:sandwech/types/product.dart';

class CartPage extends StatefulWidget {
  final int userID;

  const CartPage(this.userID, {super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String productName = "";
  String nomeUtente = "";
  List<Product> productList = const [
    Product(
        id: "1",
        name: "Panino al Salame",
        price: "2.00",
        quantity: "5",
        description: ""),
    Product(
        id: "2",
        name: "Panino proteico",
        price: "3.00",
        quantity: "7",
        description: ""),
    Product(
        id: "3",
        name: "Panino al formaggio",
        price: "1.50",
        quantity: "2",
        description: ""),
  ];

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

    getCart(widget.userID.toString()).then(
        (value) => setState(() {
              productList = value;
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
            color: const Color(0x00000000),
          ),
          Positioned(
            width: 23,
            height: 56,
            left: 4,
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
              left: 32,
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
                text: TextSpan(
                  text: 'Ciao, ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontFamily: 'Inter'),
                  children: <TextSpan>[
                    TextSpan(
                        text: nomeUtente,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ))),
          GestureDetector(
              onTap: () {},
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 50),
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
          Align(
            alignment: Alignment.center,
            child: Container(
              child: (() {
                if (productList.isEmpty) {
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
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartCard(
                        1,
                        productList[index].name,
                        productList[index].price,
                      );
                    },
                  );
                }
              }()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNavi(2, widget.userID),
    );
  }
}
