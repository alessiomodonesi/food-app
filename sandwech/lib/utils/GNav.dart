import 'package:flutter/material.dart';
import 'package:sandwech/pages/logintry.dart';
import 'package:sandwech/pages/homepage.dart';
import 'package:sandwech/pages/product.dart';
//import 'package:sandwech/pages/cart.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GNavi extends StatefulWidget {
  const GNavi({Key? key}) : super(key: key);

  @override
  State<GNavi> createState() => GNavState();
}

class GNavState extends State<GNavi> {
  List<Widget> pages = [HomePage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          color: Colors.white,
          // ignore: prefer_const_constructors
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GNav(
              haptic: true,
              color: const Color.fromARGB(255, 255, 166, 0),
              activeColor: Colors.red,
              //tabBackgroundColor: Colors.grey,
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profilo',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Carrello',
                  onPressed: () {
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => CartPage()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
