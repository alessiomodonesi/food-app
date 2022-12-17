import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sandwech/pages/catalog.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Try extends StatelessWidget {
  const Try({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      new GestureDetector(
          onTap: () {
            print("Container clicked");
          },
          child: new Container(
            width: 500.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            color: Colors.green,
            child: new Column(children: [
              new Text("Ableitungen"),
            ]),
          ))
    ]);
  }
}
