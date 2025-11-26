import 'package:flutter/material.dart';

/// Define this class for all colors that can be used in the application
/// You can define [Color] in the following way:
///
/// static const Color colorName = Color(colorHex);
///
///
/// You can also define [MaterialColor] in the same class in the following way:
///
/// static const MaterialColor materialColor = MaterialColor(
///     colorHex,
///     \<int, Color>{
///       50: Color(colorHex50),
///       100: Color(colorHex100),
///       200: Color(colorHex200),
///       300: Color(colorHex300),
///       400: Color(colorHex400),
///       500: Color(colorHex500),
///       600: Color(colorHex600),
///       700: Color(colorHex700),
///       800: Color(colorHex800),
///       900: Color(colorHex900),
///     },
///   );

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color semiBlack = Color(0xFF4A4A4A);
  static const Color blackAccent = Color(0xFF333333);

  static const Color redAccent = Color.fromARGB(255, 255, 52, 72);
  static const Color red = Color(0XFFDE0017);
  static const Color grey = Color(0xFFD1D1D1);

  static const Color greyAccent = Color(0xFFF4F4F4);
  static const Color gold = Color.fromARGB(255, 212, 166, 97);
  static const Color textGrey = Color(0xFFA89E9E);
  static const Color darkGray = Color.fromARGB(255, 183, 183, 183);
  static const Color borderGray = Color(0xFF707070);
  static const Color cardGray = Color(0xFFD1D1D1);
  static const Color greenAccent = Color(0xFFD9ECD9);

  static const Color mold = Color(0xFFD8E6D8);
  static const Color green = Color(0xFF288328);

  static const Color orange = Colors.orange;
  static const Color blue = Colors.blue;

  static const Color white = Color(0xFFFFFFFF);

  static const Color shadowBlack = Color(0x29000000);
  static const Color transparent = Colors.transparent;

  static MaterialColor _createMaterialColor(Color color) {
    Map<int, Color> swatch = {
      50: color.withValues(alpha: 0.05),
      100: color.withValues(alpha: 0.1),
      200: color.withValues(alpha: 0.2),
      300: color.withValues(alpha: 0.3),
      400: color.withValues(alpha: 0.4),
      500: color.withValues(alpha: 0.5),
      600: color.withValues(alpha: 0.6),
      700: color.withValues(alpha: 0.7),
      800: color.withValues(alpha: 0.8),
      900: color.withValues(alpha: 0.9),
    };
    return MaterialColor(color.toARGB32(), swatch);
  }

  static final MaterialColor lightMaterialColor = _createMaterialColor(black);
  static final MaterialColor darkMaterialColor = _createMaterialColor(white);
}
