import 'package:flutter_test/flutter_test.dart';
import 'package:gnucashx/utils/utils.dart';
import 'package:gnucashx/data/models/guid.dart';

void main() {
  group('GUID:', () {
    const sampleGuid = 'eb9dd351a71c493e842ad3d990fcff9d';
    test('Check GUID value', () {
      final guid = const GUID(value: sampleGuid);
      expect(guid.value, sampleGuid);
    });

    test('Check == operator', () {
      expect(const GUID(value: sampleGuid), const GUID(value: sampleGuid));
    });

    test('.generate(): Check GUID encoding length', () {
      final guid = GUID.generate();
      expect(guid.value.length, kGUIDEncodingLength);
    });

    test('.generate(): Check if consecutive generate is unique', () {
      final guid1 = GUID.generate();
      final guid2 = GUID.generate();
      expect(guid1 != guid2, true);
    });
  });
}
