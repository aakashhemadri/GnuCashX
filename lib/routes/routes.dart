import 'package:flutter/material.dart';
import 'package:gnucashx/view/view.dart';

class RouteManager {
  static const String mainPage = '/';
  static const String settingsPage = '/settings';
  static const String aboutPage = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainView(),
        );

      case settingsPage:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
        );

      case aboutPage:
        return MaterialPageRoute(
          builder: (context) => const AboutView(),
        );
      default:
        throw const FormatException();
    }
  }
}
