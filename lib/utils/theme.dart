import 'package:flutter/material.dart';

Color _brandColor = const Color.fromRGBO(81, 205, 106, 1);

ColorScheme brandLightColorScheme =
    ColorScheme.fromSeed(seedColor: _brandColor, brightness: Brightness.light);

ColorScheme brandDarkColorScheme =
    ColorScheme.fromSeed(seedColor: _brandColor, brightness: Brightness.dark);
