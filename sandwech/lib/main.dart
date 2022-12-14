import 'package:flutter/material.dart';
import 'logintry.dart';
// import 'pages/homepage.dart';
// import 'pages/product.dart';

void main() {
  runApp(myApp());
}

// void navigateNextPage(BuildContext context) {
//   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//     return Homepage(1);
//   }));
// }

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
      home: LoginPage(),
      //home: const ProductPage(1),
      debugShowCheckedModeBanner: false,
    );
  }
}
