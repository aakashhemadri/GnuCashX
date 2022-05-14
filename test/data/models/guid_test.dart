import 'package:flutter_test/flutter_test.dart';
import 'package:gnucashx/utils/utils.dart';
import 'package:gnucashx/data/models/guid.dart';

void main() {
  group('GUID:', () {
    String sampleGuid = 'eb9dd351a71c493e842ad3d990fcff9d';
    test('Check GUID value', () {
      GUID guid = GUID(value: sampleGuid);
      expect(guid.value, sampleGuid);
    });

    test('Check == operator', () {
      expect(GUID(value: sampleGuid), GUID(value: sampleGuid));
    });

    test('.generate(): Check GUID encoding length', () {
      GUID guid = GUID.generate();
      expect(guid.value.length, kGUIDEncodingLength);
    });

    test('.generate(): Check if consecutive generate is unique', () {
      GUID guid1 = GUID.generate();
      GUID guid2 = GUID.generate();
      expect(guid1 != guid2, true);
    });
  });
}
