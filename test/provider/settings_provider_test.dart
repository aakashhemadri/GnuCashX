import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gnucashx/data/data.dart';
import 'package:gnucashx/providers/providers.dart';
import 'package:gnucashx/utils/utils.dart';

void main() {
  group('SettingsProvider:', () {
    late SettingsProvider settingsProvider;
    late Persistence localSource;
    late Persistence xmlSource;
    late Persistence sqliteSource;

    setUp(() async {
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
      await settingsProvider.removeSource(xmlSource);

      expect(settingsProvider.settings, SettingsProvider().settings);
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
      settingsProvider.addSource(localSource);
      SettingsRepo repo = SettingsRepo();

      await repo.read().then((settings) {
        expect(settingsProvider.settings, settings);
      });
    });
  });
}
