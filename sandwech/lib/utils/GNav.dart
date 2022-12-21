import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sandwech/pages/homepage.dart';
import 'package:sandwech/pages/profile.dart';
import 'package:sandwech/pages/cart.dart';
import 'package:sandwech/types/user.dart';

class GNavi extends StatefulWidget {
  final int _currentIndex;
  final User userData;

  const GNavi(this._currentIndex, this.userData, {Key? key}) : super(key: key);
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
                if (widget._currentIndex != 0) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(widget.userData)));
                }
              },
            ),
            GButton(
              icon: Icons.person,
              text: 'Profilo',
              onPressed: () {
                if (widget._currentIndex != 1) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(widget.userData)));
                }
              },
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Carrello',
              onPressed: () {
                if (widget._currentIndex != 2) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartPage(widget.userData)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
