import 'package:flutter/material.dart';

// Color _brandColor = Color.fromRGBO(81, 205, 106, 1);
Color _brandColor = Colors.green.shade50;
// Color _brandColor = Colors.red.shade50;

ColorScheme brandLightColorScheme =
    ColorScheme.fromSeed(seedColor: _brandColor, brightness: Brightness.light);

ColorScheme brandDarkColorScheme =
    ColorScheme.fromSeed(seedColor: _brandColor, brightness: Brightness.dark);

// ThemeData dynamicTheme = ThemeData(colorScheme: ColorScheme.harmonized());
