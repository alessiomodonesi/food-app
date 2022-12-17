import 'dart:developer';

import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/ingredient.dart';

import 'package:flutter/material.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:sandwech/utils/navbar.dart';
import 'package:sandwech/utils/calculation.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  String paninoPath = "lib/assets/panino.png";
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
          child: ButtonCircle(30, () {
            Navigator.pop(context);
          }, Icons.arrow_back_ios, Alignment.centerRight),
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
            height: calcPercentage(MediaQuery.of(context).size.height, 57),
            width: MediaQuery.of(context).size.width,
            child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 27, left: 27, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: calcPercentage(
                          MediaQuery.of(context).size.height, 12),
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
                              "lib/assets/left_side_pills.svg",
                              semanticsLabel: 'Pills',
                              width: 55,
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
                              prodotto.description as String,
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
                                        12)),
                                height: 50,
                                width: calcPercentage(
                                    MediaQuery.of(context).size.width, 70),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                    color: Color.fromRGBO(255, 155, 24, 1)),
                              )
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
