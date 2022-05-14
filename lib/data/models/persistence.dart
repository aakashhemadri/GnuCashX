import 'package:freezed_annotation/freezed_annotation.dart';

part 'persistence.freezed.dart';
part 'persistence.g.dart';

/// Settings
enum PersistenceType {
  @JsonValue('xml')
  xml,
  @JsonValue('sqlite')
  sqlite,
  @JsonValue('local')
  local
}

@Freezed()
class Persistence with _$Persistence {
  @Assert('type == PersistenceType.local')
  const factory Persistence.local(
      {@Default(PersistenceType.local) PersistenceType type,
      required String key,
      required bool favourite,
      required bool hidden,
      required DateTime created,
      required DateTime modified}) = Local;

  @Assert('type == PersistenceType.xml')
  factory Persistence.xml(
      {@Default(PersistenceType.xml) PersistenceType type,
      required Uri uri,
      required bool favourite,
      required bool hidden,
      required DateTime created,
      required DateTime modified}) = XML;

  @Assert('type == PersistenceType.sqlite')
  factory Persistence.sqlite(
      {@Default(PersistenceType.sqlite) PersistenceType type,
      required Uri uri,
      required bool favourite,
      required bool hidden,
      required DateTime created,
      required DateTime modified}) = SQLite;

  factory Persistence.fromJson(Map<String, dynamic> json) =>
      _$PersistenceFromJson(json);
}
