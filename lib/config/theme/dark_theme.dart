import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.white,
  ),
  // Add other theme properties as needed
);
