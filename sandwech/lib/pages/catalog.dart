import 'package:flutter/material.dart';
import 'package:food_app/types/product.dart';
import 'package:food_app/types/product_tag.dart';
import 'package:food_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
//import 'package:food_app/types/tag.dart';
//import 'package:food_app/pages/product.dart';

class Homepage extends StatefulWidget {
  final int idCat;
  const Homepage(this.idCat, {super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = "utente";
  String catalogName = "";
  List<Product> _productList = List.empty(growable: true);
  List<ProductTag> _productTagList = List.empty();
  int k = 0;
  int j = 0;

  String capitalize(String str) {
    return str[0].toUpperCase() + str.substring(1);
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
          for (var i = 0; i < _productTagList.length; i++)
            {
              getProduct(_productTagList[i].product).then(
                (value) => setState(() {
                  _productList.add(Product(
                      id: value[0].id.toString(),
                      name: value[0].name,
                      price: value[0].price));
                }),
              ),
            },
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
            ),
            Positioned(
                width: 23,
                height: 56,
                left: 5,
                top: -31,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFFF9B18)),
                )),
            Positioned(
                width: 23,
                height: 56,
                left: 35,
                top: -13,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFEE0F38)),
                )),
            Positioned(
                width: 400,
                height: 270,
                left: 24,
                top: 60,
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
                          text: name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ))),
            Positioned(
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 30)) /
                    2,
                width: (MediaQuery.of(context).size.width) - 30,
                top: 100,
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
                left: 30,
                top: 205,
                child: Container(
                    child: RichText(
                  text: TextSpan(
                    text: catalogName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Inter'),
                  ),
                ))),
            Container(
              padding: const EdgeInsets.only(
                top: 170,
                left: 14,
                right: 14,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _productList.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Material(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 28,
                              height: 67,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xEEEEEAEA),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(64, 0, 0, 0),
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
                                      decoration: const BoxDecoration(
                                        color: Color(0xEEEEEAEA),
                                      ),
                                      child: Image.asset(
                                          'lib/assets/sandwich.png'),
                                    ),
                                    Container(
                                        height: 20,
                                        margin: const EdgeInsets.only(
                                          top: 24,
                                          left: 80,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            text: _productList[index].name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16,
                                                fontFamily: 'Inter'),
                                          ),
                                        )),
                                    Container(
                                      height: 37,
                                      width: 57,
                                      margin: const EdgeInsets.only(
                                        top: 15,
                                        left: 302,
                                      ),
                                      child: SizedBox(
                                          height: 37,
                                          width: 57,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xFFEE0F38)),
                                            child: Center(
                                                child: RichText(
                                                    text: TextSpan(
                                              text:
                                                  "\$  ${_productList[index].price}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
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
                      ));
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: const Color.fromRGBO(166, 4, 0, 1),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.person,
                        color: Colors.white,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: Colors.white,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.shopping_cart,
                        color: Colors.white,
                      ),
                      label: '')
                ],
              ),
            )));
  }
}
