// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/pages/category.dart';
import 'package:food_app/pages/homepage.dart';
import 'package:flutter/cupertino.dart';

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
        body: Container(
            color: const Color(0xFFFFFFFF),
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("lib/assets/right_side_pills.svg",
                        semanticsLabel: 'Pills'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("lib/assets/app_logo.svg",
                        semanticsLabel: 'SandWech Logo'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset("lib/assets/left_side_pills.svg",
                        semanticsLabel: 'Pills'),
                  ],
                ),
                Form(
                    child: Column(
                  children: <Widget>[
                    Positioned(
                        left: (MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 30)) /
                            2,
                        width: (MediaQuery.of(context).size.width) - 30,
                        top: 200,
                        child: Material(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 100, 0, 0),
                                  child: SizedBox(
                                    width: (MediaQuery.of(context).size.width) -
                                        30,
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "email",
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                                255, 239, 237, 237),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 0,
                                                color: Color.fromARGB(
                                                    255, 239, 237, 237),
                                              ),
                                            ))),
                                  )),
                            ],
                          ),
                        )),
                    Positioned(
                        left: (MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 30)) /
                            2,
                        width: (MediaQuery.of(context).size.width) - 30,
                        top: 200,
                        child: Material(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  child: SizedBox(
                                    width: (MediaQuery.of(context).size.width) -
                                        30,
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "password",
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                                255, 239, 237, 237),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 0,
                                                color: Color.fromARGB(
                                                    255, 239, 237, 237),
                                              ),
                                            ))),
                                  )),
                            ],
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text('Accedi'))
                  ],
                ))
              ],
            )));
  }
}

/*
Positioned(
                left: (MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 30)) /
                    2,
                width: (MediaQuery.of(context).size.width) - 30,
                top: 126,
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
                )),*/