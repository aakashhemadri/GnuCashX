import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'guid.freezed.dart';
part 'guid.g.dart';

@Freezed()
class GUID with _$GUID {
  const factory GUID({required String value}) = _GUID;
  factory GUID.generate() => GUID(value: GUID._generate());
  factory GUID.fromJson(Map<String, dynamic> json) => _$GUIDFromJson(json);

  static String _generate() => const Uuid().v4().split('-').join('');
}
