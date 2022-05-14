import 'package:flutter_test/flutter_test.dart';
import 'package:gnucashx/data/data.dart';

void main() {
  group('Persistence:', () {
    test('.local(): Check key', () {
      const String kSomeKey = 'SomeKey';
      Persistence persist = Persistence.local(
          key: kSomeKey, created: DateTime.now(), modified: DateTime.now());

      persist.maybeMap(
          local: (Local value) => expect(value.key, kSomeKey),
          orElse: () => fail('Initialized persistence type other than Local'));
    });
  });
}
