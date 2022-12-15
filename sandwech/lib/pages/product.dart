import 'package:flutter/material.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/utils/utils.dart';
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
  }

  /// Controlla se la descrizione contiene qualcosa, sennò ritorna una stringa preimpostata
  String checkDescription(String str) {
    if (str.isNotEmpty) {
      return str;
    } else {
      return "Descrizione non disponibile";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image.asset(paninoPath),
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
                    top: 10, bottom: 27, left: 27, right: 27),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 45,
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              prodotto.name, // nome prodotto
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.9,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: calcPercentage(
                              MediaQuery.of(context).size.width, 12),
                        ),
                        SvgPicture.asset(
                          "lib/assets/left_side_pills.svg",
                          semanticsLabel: 'Pills',
                          width: 50,
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
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
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
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
                      ],
                    )
                  ],
                )),
          ),
        )
      ]),
    );
  }
}
