import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sandwech/pages/homepage.dart';
import 'package:sandwech/pages/user.dart';
import 'package:sandwech/pages/cart.dart';

class GNavi extends StatefulWidget {
  final int _currentIndex;
  const GNavi(this._currentIndex, {Key? key}) : super(key: key);
  @override
  State<GNavi> createState() => GNavState();
}

class GNavState extends State<GNavi> {
  //List<Widget> pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GNav(
          color: const Color.fromARGB(255, 255, 166, 0),
          activeColor: Colors.red,
          //tabBackgroundColor: Colors.grey,
          gap: 8,
          selectedIndex: widget._currentIndex,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            GButton(
              icon: Icons.person,
              text: 'Profilo',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserPage()));
              },
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Carrello',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
