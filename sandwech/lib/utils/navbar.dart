import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Navbar extends StatefulWidget {
  /// Navbar personalizzata dell'app
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color.fromRGBO(166, 4, 0, 1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: '')
            ],
          ),
        ));
  }
}
