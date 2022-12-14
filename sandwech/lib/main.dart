import 'package:flutter/material.dart';
import 'logintry.dart';
import 'pages/homepage.dart';

void main() {
  runApp(myApp());
}

void navigateNextPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return Homepage(1);
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
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
