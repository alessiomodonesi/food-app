import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/calculation.dart';
import 'package:sandwech/utils/profile_button.dart';
import 'package:sandwech/pages/resetUserPass.dart';
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
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: getPaddingDevice(10, 100)),
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
                margin: getPaddingDevice(3, 45),
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
              ProfileButton(
                width: 150,
                height: 35,
                margin: getPaddingDevice(25, 275),
                text: "Reset",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReserUserPasswordPage()));
                },
              ),
              ProfileButton(
                width: 150,
                height: 35,
                margin: const EdgeInsets.only(top: 20),
                text: "Esci",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GNavi(1, widget.userData),
    );
  }
}
