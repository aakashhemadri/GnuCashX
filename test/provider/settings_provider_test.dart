import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gnucashx/data/data.dart';
import 'package:gnucashx/providers/providers.dart';
import 'package:gnucashx/utils/utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsProvider:', () {
    late SettingsProvider settingsProvider;
    late Persistence localSource;
    late Persistence xmlSource;
    late Persistence sqliteSource;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      settingsProvider = SettingsProvider();
      await settingsProvider.reset();
      await settingsProvider.init();

      localSource = Persistence.local(
          key: kLocalGncKey,
          guid: GUID.generate(),
          created: DateTime.now(),
          modified: DateTime.now());

      xmlSource = Persistence.xml(
          uri: Uri.file(kSampleXMLFile),
          guid: GUID.generate(),
          created: DateTime.now(),
          modified: DateTime.now());

      sqliteSource = Persistence.sqlite(
          uri: Uri.file(kSampleSQLiteFile),
          guid: GUID.generate(),
          created: DateTime.now(),
          modified: DateTime.now());
    });

    test('.addSource(): Check if sources are added correctly', () async {
      await settingsProvider.addSource(localSource);
      await settingsProvider.addSource(xmlSource);
      await settingsProvider.addSource(sqliteSource);

      expect(settingsProvider.settings.sources,
          [localSource, xmlSource, sqliteSource]);
    });

    test('.removeSource(): Check behaviour when deleting empty sources',
        () async {
      await settingsProvider.removeSource(localSource);

      expect(settingsProvider.settings.sources, <Persistence>[]);
    });

    test('.removeSource(): Check if correct source is removed', () async {
      await settingsProvider.addSource(localSource);
      await settingsProvider.addSource(xmlSource);
      await settingsProvider.addSource(sqliteSource);

      await settingsProvider.removeSource(xmlSource);

      expect(settingsProvider.settings.sources, [localSource, sqliteSource]);
    });

    test('.updateTheme(): Check for correct theme', () async {
      await settingsProvider.updateTheme(ThemeMode.dark);

      expect(settingsProvider.settings.theme, ThemeMode.dark);
    });

    test('_commit(): Compare local storage with in-memory object', () async {
      await settingsProvider.addSource(localSource);
      final repo = SettingsRepo();

      final settings = await repo.read();
      expect(settingsProvider.settings, settings);
    });
  });
}
