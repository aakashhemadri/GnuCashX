import 'package:flutter_test/flutter_test.dart';
import 'package:gnucashx/utils/theme.dart';
import 'package:gnucashx/data/data.dart';

import 'package:intl/intl.dart';

void main() {
  group('Settings:', () {
    test('.local(): Check default Theme', () {
      expect(Settings.local().theme, Theme.light);
    });

    test('.local(): Check if default locale is system locale', () {
      expect(Settings.local().locale, Intl.systemLocale);
    });

    test('.local(): Check if default source is favourite', () {
      expect(Settings.local().source[0].favourite, true);
    });
  });
}
