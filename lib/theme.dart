import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AppTheme {
  static Color get primaryColor => const Color.fromARGB(255, 142, 84, 233);
  static Color get secondaryColor => const Color.fromARGB(255, 13, 16, 209);
  static Color get displayColor => const Color.fromARGB(255, 59, 19, 123);
  static Color get neutralColor => const Color.fromARGB(255, 238, 230, 251);

  static LinearGradient defaultGradient({
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter,
    tileMode = TileMode.mirror,
  }) =>
      LinearGradient(
        tileMode: tileMode,
        begin: begin,
        end: end,
        colors: [
          AppTheme.primaryColor,
          AppTheme.secondaryColor,
        ],
      );
  static titleText({double? fontSize, FontWeight? fontWeight, Color? color}) =>
      TextStyle(
          fontSize: fontSize ?? 17,
          fontWeight: fontWeight,
          color: color ?? AppTheme.neutralColor);
  static displayText(
          {double? fontSize, FontWeight? fontWeight, Color? color}) =>
      TextStyle(
          fontSize: fontSize ?? 17,
          fontWeight: fontWeight,
          color: color ?? AppTheme.displayColor);
  static labelText({double? fontSize, FontWeight? fontWeight, Color? color}) =>
      TextStyle(fontSize: fontSize ?? 15, fontWeight: fontWeight, color: color);
}

ThemeData currentAppTheme = ThemeData();
