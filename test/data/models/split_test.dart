import 'package:flutter_test/flutter_test.dart';
import 'package:gnucashx/data/models/models.dart';

void main() {
  group('Split:', () {
    late Split split;
    const int kNum = 1024;
    const int kDenom = 100;

    setUp((() {
      split = Split(
          guid: GUID.generate(),
          txGuid: GUID.generate(),
          accountGuid: GUID.generate(),
          reconcileDate: DateTime.now(),
          valueNum: kNum,
          valueDenom: kDenom,
          quantityNum: kNum,
          quantityDenom: kDenom,
          lotGuid: GUID.generate());
    }));

    test('get value', () {
      expect(split.value, kNum / kDenom);
    });

    test('get quantity', () {
      expect(split.quantity, kNum / kDenom);
    });
  });
}
