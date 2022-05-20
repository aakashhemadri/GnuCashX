import 'package:flutter/material.dart';

// Color _brandColor = Color.fromRGBO(81, 205, 106, 1);
Color _brandColor = Colors.green.shade700;

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: _brandColor,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: _brandColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

// ThemeData dynamicTheme = ThemeData(colorScheme: ColorScheme.harmonized());
