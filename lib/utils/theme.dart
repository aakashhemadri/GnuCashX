import 'package:json_annotation/json_annotation.dart';

enum Theme {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark
}
