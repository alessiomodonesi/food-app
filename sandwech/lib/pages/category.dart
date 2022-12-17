// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/pages/catalog.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var titles = {
      "PANINI": "1",
      "PIADINE": "3",
      "BRIOCHES": "4",
      "SNACK": "5",
      "BIBITE": "2"
    };

    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
            //image: ,
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(255, 158, 11, 0)),
      ),
      Container(
        decoration: BoxDecoration(
            //image: ,
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(228, 255, 194, 28)),
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(255, 255, 17, 0)),
      ),
      InkWell(
          onTap: () {
            log('mzzz');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(255, 158, 11, 0)),
          )),
      Container(
        decoration: BoxDecoration(
            //image: ,
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(228, 255, 194, 28)),
      ),
    ];

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: VerticalCardPager(
                      titles: titles.keys.toList(), // required
                      images: images, // required
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold), // optional
                      onPageChanged: (page) {
                        // optional
                      },
                      onSelectedItem: (index) {
                        if (!titles.values
                            .toList()
                            .contains((index + 1).toString())) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage(1)));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Errore")));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage(int.parse(
                                      titles.values.toList()[index]))));
                        }
                        // optional
                      },
                      initialPage: 0, // optional
                      align: ALIGN.CENTER // optional
                      ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(top: 50),
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
                      icon: //Padding(padding: EdgeInsets.all(10)); ma che cazzo dc, aggiustare.
                          Icon(
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
