import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gnucashx/providers/providers.dart';
import 'package:gnucashx/utils/utils.dart';
import 'package:gnucashx/routes/routes.dart';

final SettingsProvider settings = SettingsProvider();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await settings.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => settings),
    ChangeNotifierProvider(create: (context) => UIProvider()),
  ], child: const GncApp()));
}

class GncApp extends StatelessWidget {
  const GncApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) => DynamicColorBuilder(
                builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
              ColorScheme lightColorScheme;
              ColorScheme darkColorScheme;

              if (lightDynamic != null &&
                  darkDynamic != null &&
                  settingsProvider.settings.isDynamic) {
                lightColorScheme = lightDynamic.harmonized();
                darkColorScheme = darkDynamic.harmonized();
              } else {
                lightColorScheme = brandLightColorScheme.harmonized();
                darkColorScheme = brandDarkColorScheme.harmonized();
              }

              return MaterialApp(
                title: kAppTitle,
                initialRoute: RouteManager.mainPage,
                onGenerateRoute: RouteManager.generateRoute,
                theme: ThemeData(
                    colorScheme: lightColorScheme,
                    useMaterial3: settingsProvider.settings.useMaterial3),
                darkTheme: ThemeData(
                    colorScheme: darkColorScheme,
                    useMaterial3: settingsProvider.settings.useMaterial3),
                themeMode: settingsProvider.settings.theme,
              );
            }));
  }
}
