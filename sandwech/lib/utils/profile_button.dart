import 'package:flutter/material.dart';

// constants
double sizeFont = 24;
Color bgColor = const Color.fromARGB(255, 158, 11, 0);
BorderRadiusGeometry radiusCorner = BorderRadius.circular(30);

class ProfileButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final String text;
  final GestureTapCallback onTap;

  const ProfileButton({
    super.key,
    required this.width,
    required this.height,
    required this.margin,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: radiusCorner,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: sizeFont,
            ),
          ),
        ));
  }
}
