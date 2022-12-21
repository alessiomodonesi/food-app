import 'package:flutter/material.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/product_tag.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandwech/utils/circle_button.dart';
import 'package:sandwech/utils/cart_card.dart';
import 'package:sandwech/pages/product.dart';

class CatalogPage extends StatefulWidget {
  final int idCat;
  final int userID;

  const CatalogPage(this.idCat, this.userID, {super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String catalogName = "";
  List<Product> _productList = List.empty(growable: true);
  List<ProductTag> _productTagList = List.empty();
  String nomeUtente = "";

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

  @override
  void initState() {
    super.initState();
    getTag(widget.idCat.toString()).then(
        (value) => setState(() {
              catalogName = capitalize(value[0].name);
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });

    getProductTag(widget.idCat.toString()).then(
        (value) => setState(() {
              _productTagList = value;
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    }).then((value) => {
          if (_productTagList.isNotEmpty)
            {
              for (var i = 0; i < _productTagList.length; i++)
                {
                  getProducts(_productTagList[i].product).then(
                    (value) => setState(() {
                      _productList.add(Product(
                          id: value[0].id.toString(),
                          name: value[0].name,
                          price: value[0].price));
                    }),
                  ),
                },
            }
        });

    getUser(widget.userID.toString()).then(
        (value) => setState(() {
              nomeUtente = value.name;
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
                          text: nomeUtente,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ))),
            Positioned(
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 30)) /
                    2,
                width: (MediaQuery.of(context).size.width) - 30,
                top: 110,
                child: Material(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: CupertinoSearchTextField(
                          borderRadius: BorderRadius.circular(20),
                          placeholder: 'Cerca qualcosa...',
                          prefixInsets: const EdgeInsets.only(left: 10),
                          suffixIcon:
                              const Icon(CupertinoIcons.slider_horizontal_3),
                          suffixMode: OverlayVisibilityMode.always,
                          suffixInsets: const EdgeInsets.only(right: 10),
                          onSuffixTap: () {},
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                width: 100,
                height: 24,
                left: 40,
                top: 175,
                child: Container(
                    child: RichText(
                  text: TextSpan(
                    text: catalogName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        fontFamily: 'Inter'),
                  ),
                ))),
            Container(
                padding: const EdgeInsets.only(
                  top: 150,
                  left: 14,
                  right: 14,
                ),
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
                            //log(_productList[index].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        debugUserID,
                                        int.parse(_productList[index].id),
                                        widget.userID)));
                          },
                          child: CartCard(
                            1,
                            _productList[index].name,
                            _productList[index].price,
                          ),
                        );
                      },
                    );
                    /*return ListView.builder(
                        shrinkWrap: true,
                        itemCount: _productList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                log(_productList[index].id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductPage(
                                            debugUserID,
                                            int.parse(_productList[index].id),
                                            widget.userID)));
                              },
                              child: Container(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Material(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              28,
                                          height: 67,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xEEEEEAEA),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          64, 0, 0, 0),
                                                      blurRadius: 7,
                                                      offset: Offset(0, 4)),
                                                ]),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 55,
                                                  width: 55,
                                                  margin: const EdgeInsets.only(
                                                    left: 14,
                                                    top: 6,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xEEEEEAEA),
                                                  ),
                                                  child: Image.asset(
                                                      'lib/assets/icons/${tagName(widget.idCat)}-icon.png'),
                                                ),
                                                Container(
                                                    height: 20,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 24,
                                                      left: 80,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text:
                                                            _productList[index]
                                                                .name,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Inter'),
                                                      ),
                                                    )),
                                                Container(
                                                  height: 37,
                                                  width: 65,
                                                  margin: const EdgeInsets.only(
                                                    top: 15,
                                                    left: 302,
                                                  ),
                                                  child: SizedBox(
                                                      child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: rossoApp),
                                                    child: Center(
                                                        child: RichText(
                                                            text: TextSpan(
                                                      text:
                                                          "${_productList[index].price} €",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16,
                                                          fontFamily: 'Inter'),
                                                    ))),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )));
                        });*/
                  }
                }()) /**/
                ),
          ],
        ),
        bottomNavigationBar: GNavi(0, widget.userID));
  }
}
