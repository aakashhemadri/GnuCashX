import 'package:uuid/uuid.dart';

import 'package:gnucashx/utils/utils.dart';

class GUID {
  late final String value;

  GUID.from(this.value) : assert(value.length == kGUIDEncodingLength);

  GUID.generate() {
    value = const Uuid().v4().split('-').join('');
  }
}
