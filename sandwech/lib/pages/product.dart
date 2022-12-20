import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/calculation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

/// Pagina del singolo prodotto
///
/// Bisogna passare al costruttore l'id del prodotto in formato [int]
class ProductPage extends StatefulWidget {
  // attributi
  final int idUser;
  final int idProduct;
  final int userID;

  const ProductPage(this.idUser, this.idProduct, this.userID, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String paninoPath = "lib/assets/images/panino.png";
  // ignore: prefer_const_constructors
  Product prodotto = Product(id: '0', name: '', price: '');
  List<Ingredient> ingredienti = List.empty();
  int quantita = 1;

  int addDescrizione = 2;
  int addIngredienti = 2;

  int moltiplicatoreNoDescrizione = 0;
  int moltiplicatoreNoIngredienti = 0;

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
      setState(() {
        if (str.length > 46) {
          moltiplicatoreNoDescrizione = 0;
        } else {
          moltiplicatoreNoDescrizione = addDescrizione;
        }
      });
      //log("La descrizione ha : ${str.length}}");
      return str;
    } else {
      setState(() {
        moltiplicatoreNoDescrizione = addDescrizione;
      });
      return "Descrizione non disponibile";
    }
  }

  String concatIngredients(List<Ingredient> ing) {
    var listOfIngredients = "";

    if (ing.isEmpty) {
      setState(() {
        moltiplicatoreNoIngredienti = addIngredienti;
      });
      return "Lista degli ingredienti non disponibile";
    } else {
      setState(() {
        moltiplicatoreNoIngredienti = 0;
      });
    }

    for (int i = 0; i < ing.length; i++) {
      if (i != 0) {
        listOfIngredients += ", ${ing[i].name}";
      } else {
        listOfIngredients += ing[i].name;
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
          top: 45,
          left: 12,
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
                                color: rossoApp,
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
                                color: ambratoApp,
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
                              checkDescription(prodotto.description.toString()),
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
                                    color: ambratoApp,
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
                                        9.8 +
                                            moltiplicatoreNoIngredienti +
                                            moltiplicatoreNoDescrizione)),
                                height: 50,
                                width: calcPercentage(
                                    MediaQuery.of(context).size.width, 80),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                  color: ambratoApp,
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
                                      width: 50,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 120,
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

                                          // Diminuisce numero prodotti
                                          ButtonCircle(
                                              25,
                                              ambratoApp,
                                              CupertinoIcons.minus,
                                              Alignment.center,
                                              Colors.white, () {
                                            setState(() {
                                              if (quantita > 1) {
                                                quantita--;
                                              }
                                            });
                                          }),
                                          Text(
                                            quantita.toString(),
                                            textScaleFactor: 1.6,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          // Aumenta numero prodotti
                                          ButtonCircle(
                                              25,
                                              ambratoApp,
                                              CupertinoIcons.plus,
                                              Alignment.center,
                                              Colors.white, () {
                                            setState(() {
                                              if (quantita < 99) {
                                                quantita++;
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
                                    ButtonCircle(
                                        35,
                                        Colors.white,
                                        CupertinoIcons.cart_fill,
                                        Alignment.center,
                                        ambratoApp, () {
                                      addItemCart(widget.idUser,
                                          widget.idProduct, quantita);
                                      setState(() {
                                        quantita = 1;
                                      });
                                    })
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
      bottomNavigationBar: GNavi(0, widget.userID),
    );
  }
}
