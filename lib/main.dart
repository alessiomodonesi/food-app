import 'package:flutter/material.dart';
import 'logintry.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'login try',
        theme: ThemeData(
          primarySwatch: Colors.red, //fabulous
        ),
        home: LoginPage());
  }
}
