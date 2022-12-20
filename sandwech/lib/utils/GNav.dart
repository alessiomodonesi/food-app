import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GNavi extends StatefulWidget {
  const GNavi({Key? key}) : super(key: key);

  @override
  State<GNavi> createState() => GNavState();
}

class GNavState extends State<GNavi> {
  List<Widget> body = const [];
  final int _currentIndex = 0;

  // if (body != null && body.length > _currentIndex)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: body[_currentIndex]),
        bottomNavigationBar: Container(
          color: Colors.white,
          // ignore: prefer_const_constructors
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const GNav(
              color: Color.fromARGB(255, 255, 166, 0),
              activeColor: Colors.red,
              //tabBackgroundColor: Colors.grey,
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.person,
                  text: 'Profilo',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.shopping_cart, text: 'Carrello'),
              ],
            ),
          ),
        ));
  }
}
