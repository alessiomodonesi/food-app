import 'package:flutter/material.dart';
import 'logintry.dart';
import 'pages/signup.dart';
//import 'pages/product.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sandwech',
      theme: ThemeData(
        primarySwatch: Colors.red, //fabulous
      ),
      home: SignupScreen(),
      //home: const ProductPage(5),
      debugShowCheckedModeBanner: false,
    );
  }
}
