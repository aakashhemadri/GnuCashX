import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:gnucashx/provider/provider.dart';
import 'package:gnucashx/main.dart';

void main() {
  group('BookView:', () {
    final SettingsProvider settings = SettingsProvider();
    const GncApp app = GncApp();
    late MultiProvider appInstance;

    setUp(() async {
      await settings.init();
      appInstance = MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => settings),
        ChangeNotifierProvider(create: (context) => UIProvider()),
      ], child: app);
    });

    testWidgets('Check AppBar title', (tester) async {
      await tester.pumpWidget(appInstance);
      final titleFinder = find.text('Accounts');

      expect(titleFinder, findsOneWidget);
    });
  });
}
