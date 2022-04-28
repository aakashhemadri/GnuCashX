import 'package:test/test.dart';
import 'package:gnucashx/utils/utils.dart';
import 'package:gnucashx/data/models/guid.dart';

void main() {
  group('GUID:', () {
    test('.from(String): Check GUID value', () {
      /// Replace with XML retrieved guid.
      String testUid = 'eb9dd351a71c493e842ad3d990fcff9d';
      GUID guid = GUID.from(testUid);
      expect(guid.value, testUid);
    });

    test('.generate(): Check GUID encoding length', () {
      GUID guid = GUID.generate();
      expect(guid.value.length, kGUIDEncodingLength);
    });
  });
}
