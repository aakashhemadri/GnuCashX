import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gnucashx/utils/constants.dart';
import 'package:gnucashx/data/data.dart';

import 'package:intl/intl.dart';

void main() {
  group('Settings:', () {
    late Settings settings;

    setUp(() {
      settings = Settings.local();
      settings = settings.copyWith(
          sources: List<Persistence>.filled(
              1,
              Persistence.xml(
                  uri: Uri.file(kSampleXMLFile),
                  guid: GUID.generate(),
                  created: DateTime.now(),
                  modified: DateTime.now())));
    });
    test('.local(): Check default Theme', () {
      expect(settings.theme, ThemeMode.system);
    });

    test('.local(): Check if default locale is system locale', () {
      expect(settings.locale, Intl.systemLocale);
    });
  });
}
