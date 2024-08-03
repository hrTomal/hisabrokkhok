import 'package:flutter/material.dart';

ThemeData purpleTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.purple,

  scaffoldBackgroundColor: Colors.blue[50],
  appBarTheme: const AppBarTheme(
    color: Colors.purple,
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.purple,
    secondary: Colors.white,
  ),
  // Add other theme properties as needed
);
