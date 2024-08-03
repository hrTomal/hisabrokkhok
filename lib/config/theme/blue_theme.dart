import 'package:flutter/material.dart';

ThemeData blueTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.blue[50],
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.white,
  ),
  // Add other theme properties as needed
);
