import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:gnucashx/utils/utils.dart';

part 'guid.g.dart';

@JsonSerializable()
class GUID {
  late final String value;

  GUID() {
    GUID.generate();
  }

  GUID.from(this.value) : assert(value.length == kGUIDEncodingLength);

  GUID.generate() {
    value = const Uuid().v4().split('-').join('');
  }

  factory GUID.fromJson(Map<String, dynamic> json) => _$GUIDFromJson(json);

  Map<String, dynamic> toJson() => _$GUIDToJson(this);
}
