import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sandwech/utils/gnav.dart';
import 'package:sandwech/utils/calculation.dart';
import 'package:sandwech/utils/colors.dart';
import 'package:sandwech/pages/reset_user_pass.dart';
import 'package:sandwech/pages/signin.dart';
import 'package:sandwech/types/user.dart';

class ProfilePage extends StatefulWidget {
  final User userData;

  const ProfilePage(this.userData, {super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String iniziali(String nome, String cognome) {
    if (nome.isEmpty && cognome.isEmpty) {
      return "";
    }
    String profilo = nome[0].toUpperCase() + cognome[0].toUpperCase();
    return profilo;
  }

  String capText(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  EdgeInsets getPaddingDevice(double android, double ios) {
    if (Platform.isAndroid) {
      return EdgeInsets.only(
          top: calcPercentage(MediaQuery.of(context).size.height, android));
    } else if (Platform.isIOS) {
      return EdgeInsets.only(top: ios);
    }
    return const EdgeInsets.only(top: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Stack(
        children: [
          Container(),
          Positioned(
            width: 23,
            height: 56,
            left: 5,
            top: -28,
            child: Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFFF9B18),
            )),
          ),
          Positioned(
              width: 23,
              height: 56,
              left: 35,
              top: -15,
              child: Container(
                width: 23,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFFEE0F38)),
              )),
          // Positioned(
          //     width: 400,
          //     height: 270,
          //     left: 20,
          //     top: 68,
          //     child: RichText(
          //       text: TextSpan(
          //         text: 'Ciao, ',
          //         style: const TextStyle(
          //             color: Colors.black,
          //             fontStyle: FontStyle.normal,
          //             fontSize: 20,
          //             fontFamily: 'Inter'),
          //         children: <TextSpan>[
          //           TextSpan(
          //               text: widget.userData.name,
          //               style: const TextStyle(fontWeight: FontWeight.bold)),
          //         ],
          //       ),
          //     )),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: getPaddingDevice(10, 120)),
                Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            iniziali(
                                widget.userData.name, widget.userData.surname),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  margin: getPaddingDevice(3, 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      capText(widget.userData.name),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      capText(widget.userData.surname),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 285),
                  margin: const EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      capText(widget.userData.email).toLowerCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReserUserPasswordPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 158, 11, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 158, 11, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Esci',
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GNavi(1, widget.userData),
    );
  }
}
