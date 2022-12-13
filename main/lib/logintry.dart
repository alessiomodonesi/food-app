// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //String _email;
  //String _password;
  @override
  Widget build(BuildContext conterxt) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login page'),
        ),
        body: Container(
            padding: EdgeInsets.all(30.0),
            child: Form(
                child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'e-mail'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  obscureText: true,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage(1)));
                    },
                    child: Text('Accedi'))
              ],
            ))));
  }
}
