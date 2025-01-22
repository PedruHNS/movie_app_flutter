import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF7100cd),
        // showUnselectedLabels: false,
        // showSelectedLabels: true,
        selectedIconTheme: IconThemeData(size: 30),
        // elevation: 10,
      ),
    );
  }
}
