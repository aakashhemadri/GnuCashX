import 'package:flutter/material.dart';
import 'package:gnucashx/utils/theme.dart';
import 'package:provider/provider.dart';

import 'package:gnucashx/provider/provider.dart';
import 'package:gnucashx/utils/constants.dart';
import 'package:gnucashx/view/view.dart';

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
      builder: (context, value, child) => MaterialApp(
          title: kAppTitle,
          home: const MainView(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: value.settings.theme),
    );
  }
}
