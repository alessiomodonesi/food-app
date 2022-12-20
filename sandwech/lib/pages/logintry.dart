// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sandwech/pages/homepage.dart';

class OldLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OldLoginPageState();
}

class _OldLoginPageState extends State<OldLoginPage> {
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
                    SvgPicture.asset("lib/assets/svg/right_side_pills.svg",
                        semanticsLabel: 'Pills'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("lib/assets/svg/app_logo.svg",
                        semanticsLabel: 'SandWech Logo'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset("lib/assets/svg/left_side_pills.svg",
                        semanticsLabel: 'Pills'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0)),
                    Text(
                        'Uno non può pensare bene, amare bene, \ndormire bene se non ha mangiato bene.',
                        style: TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic)),
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
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: SizedBox(
                                    width: (MediaQuery.of(context).size.width) -
                                        30,
                                    child: TextField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(20.0),
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
                                      const EdgeInsets.fromLTRB(0, 30, 0, 20),
                                  child: SizedBox(
                                    width: (MediaQuery.of(context).size.width) -
                                        30,
                                    child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.all(20.0),
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                          Text('Password dimenticata?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 158, 11, 0),
                                  fontSize: 14,
                                  decoration: TextDecoration.underline)),
                        ]),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 158, 11, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text('Accedi'),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 158, 11, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text('Registrati'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}
