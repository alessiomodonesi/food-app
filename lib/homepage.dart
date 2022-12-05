import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = "sample";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFFFFFFFF),
        ),
        Positioned(
            width: 23,
            height: 56,
            left: 5,
            top: -31,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFFFF9B18)),
            )),
        Positioned(
            width: 23,
            height: 56,
            left: 35,
            top: -13,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFFEE0F38)),
            )),
        Positioned(
            width: 400,
            height: 270,
            left: 24,
            top: 60,
            child: Container(
                child: RichText(
              text: TextSpan(
                text: 'Ciao, ',
                style: const TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontFamily: 'Inter'),
                children: <TextSpan>[
                  TextSpan(
                      text: name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ))),
        Positioned(
            left: 30,
            top: 126,
            child: Material(
              child: Column(
                children: [
                  SizedBox(
                    width: 330,
                    height: 39,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(341),
                        ),
                        filled: true,
                        fillColor: const Color(0xEEEEEAEA),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
