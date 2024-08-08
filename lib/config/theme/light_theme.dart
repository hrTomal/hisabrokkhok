import 'package:business_tracker/config/theme/material_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // appBarTheme: const AppBarTheme(
  //   color: Colors.blue,
  // ),
  colorScheme: MaterialTheme.lightScheme(),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return MaterialTheme.lightScheme().primary;
        }
        return null; // Defer to the default value
      },
    ),
  ),
  // textTheme: TextTheme(
  //   bodyLarge: TextStyle(color: MaterialTheme.lightScheme().onSurface),
  //   bodyMedium: TextStyle(color: MaterialTheme.lightScheme().onSurfaceVariant),
  //   displayLarge: TextStyle(color: MaterialTheme.lightScheme().primary),
  //   displayMedium: TextStyle(color: MaterialTheme.lightScheme().onPrimary),
  //   // Add other text styles as needed
  // ),
);
