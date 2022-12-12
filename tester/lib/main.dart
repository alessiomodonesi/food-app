import 'package:flutter/material.dart';
import 'logintry.dart';
import 'homepage.dart';

void main() {
  runApp(myApp());
}

void navigateNextPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return Homepage();
  }));
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
