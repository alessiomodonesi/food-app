import 'dart:developer';

import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/ingredient.dart';

import 'package:flutter/material.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:sandwech/utils/navbar.dart';
import 'package:sandwech/utils/calculation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

/// Pagina del singolo prodotto
///
/// Bisogna passare al costruttore l'id del prodotto in formato [int]
class ProductPage extends StatefulWidget {
  final int idProduct; // attributo

  const ProductPage(this.idProduct, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String paninoPath = "lib/assets/images/panino.png";
  // ignore: prefer_const_constructors
  Product prodotto = Product(id: '0', name: '', price: '');
  List<Ingredient> ingredienti = List.empty();

  @override
  void initState() {
    super.initState();
    getSingleProduct(widget.idProduct.toString()).then(
        (value) => setState(() {
              prodotto = value as Product;
              checkDescription(prodotto.description as String);
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });

    getArchieveIngredients(widget.idProduct.toString()).then(
        (value) => setState(() {
              ingredienti = value;
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });
  }

  /// Controlla se la descrizione contiene qualcosa, sennò ritorna una stringa preimpostata
  String checkDescription(String str) {
    if (str.isNotEmpty) {
      return str;
    } else {
      return "Descrizione non disponibile";
    }
  }

  String concatIngredients(List<Ingredient> ing) {
    var listOfIngredients = "";

    for (int i = 0; i < ing.length; i++) {
      if (i != 0) {
        listOfIngredients += ", ${ing[i].name}";
      } else {
        listOfIngredients += " ${ing[i].name}";
      }
    }

    return listOfIngredients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image.asset(paninoPath),
        Positioned(
          top: 40,
          left: 10,
          child: ButtonCircle(30, Colors.white, Icons.arrow_back_ios,
              Alignment.centerRight, Colors.black, () {
            Navigator.pop(context);
          }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              color: Colors.white,
            ),
            height: calcPercentage(MediaQuery.of(context).size.height, 50),
            width: MediaQuery.of(context).size.width,
            child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 27, left: 27, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          calcPercentage(MediaQuery.of(context).size.height, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // nome prodotto
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              prodotto.name,
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.9,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //icona a destra del nome del prodotto
                          Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(
                              "lib/assets/svg/left_side_pills.svg",
                              semanticsLabel: 'Pills',
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //informazioni relative al prodotto, con tanto di pulsanti
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.grey,
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Descrizione",
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              prodotto.description.toString(),
                              textScaleFactor: 1,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Ingredienti",
                                  textAlign: TextAlign.left,
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(concatIngredients(ingredienti)),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: calcPercentage(
                                        MediaQuery.of(context).size.height,
                                        9.8)),
                                height: 50,
                                width: calcPercentage(
                                    MediaQuery.of(context).size.width, 70),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                  color: const Color.fromRGBO(255, 155, 24, 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: const Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    /*
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    */
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "€${prodotto.price}",
                                        textScaleFactor: 1.75,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25.0)),
                                        //color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          ButtonCircle(
                                              25,
                                              ambratoApp,
                                              CupertinoIcons.plus,
                                              Alignment.center,
                                              Colors.white, () {
                                            // aumentare numero carrello
                                          }),
                                          const Text(
                                            "1",
                                            textScaleFactor: 1.6,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          ButtonCircle(
                                              25,
                                              ambratoApp,
                                              CupertinoIcons.minus,
                                              Alignment.center,
                                              Colors.white, () {
                                            // diminuire numero carrello
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
                                    ButtonCircle(
                                        35,
                                        Colors.white,
                                        CupertinoIcons.cart_fill,
                                        Alignment.center,
                                        Colors.amber,
                                        () {})
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        )
      ]),
      bottomNavigationBar: const Navbar(),
    );
  }
}
