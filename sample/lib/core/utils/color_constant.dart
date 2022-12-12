import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9004c = fromHex('#4c000000');

  static Color gray600 = fromHex('#707070');

  static Color orange400A2 = fromHex('#a2ff9b18');

  static Color gray800 = fromHex('#414040');

  static Color red900 = fromHex('#a60400');

  static Color bluegray100 = fromHex('#d9d9d9');

  static Color red90075 = fromHex('#75a60400');

  static Color orange400 = fromHex('#ff9b18');

  static Color gray200 = fromHex('#eeeaea');

  static Color black9003f = fromHex('#3f000000');

  static Color gray201 = fromHex('#ececec');

  static Color deepOrangeA700Bc = fromHex('#bcf21717');

  static Color yellow900Bc = fromHex('#bcf29317');

  static Color orange40075 = fromHex('#75ff9b18');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color redA400 = fromHex('#ee0f38');

  static Color deepOrangeA700 = fromHex('#f21818');

  static Color red900A2 = fromHex('#a2a60400');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
