import 'package:flutter/material.dart';

class AppColors {
  // Main app colors
  static const Color black = Color(0xff1d222a);
  static const Color darkGray = Color(0xff222831);
  static const Color gray = Color(0xff393e46);
  static const Color turquoise = Color(0xff00adb5);
  static const Color white = Color(0xffeeeeee);
  // Gradient colors
  static const List<Color> gradients = [
    Color(0xffe0c700),
    Color(0xff097978),
  ];
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
