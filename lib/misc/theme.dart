import 'package:flutter/material.dart';

class ThemeManager {
  final Color baleWhite = const Color(0xFFf8f9ff);
  final Color metalic = const Color(0xFFaab6c8);
  final Color darkGrey = const Color(0xFF333333);

  late final ThemeData lightTheme;
  ThemeManager() {
    lightTheme = ThemeData(
      scaffoldBackgroundColor: baleWhite,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.orange,
            secondary: Colors.orange,
          ),
    );
  }
}
