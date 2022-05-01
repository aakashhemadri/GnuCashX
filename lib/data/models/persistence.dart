import 'package:json_annotation/json_annotation.dart';

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

@JsonSerializable()
abstract class Persistence {
  late PersistenceType type;
  late Uri uri;
  late bool favourite;
  late bool hidden;
  late DateTime created;
  late DateTime modified;

  factory Persistence(
    PersistenceType type,
    String uri,
  ) {
    switch (type) {
      case PersistenceType.xml:
        return XMLPersistence(type, Uri.parse(uri));
      case PersistenceType.sqlite:
        return SQLitePersistence(type, Uri.parse(uri));
      case PersistenceType.local:
        return LocalPersistence(type, uri);
    }
  }

  factory Persistence.fromJson(Map<String, dynamic> json) =>
      _$PersistenceFromJson(json);

  Map<String, dynamic> toJson() => _$PersistenceToJson(this);
}

@JsonSerializable()
class XMLPersistence implements Persistence {
  @override
  late DateTime created;

  @override
  late bool favourite;

  @override
  late bool hidden;

  @override
  late DateTime modified;

  @override
  PersistenceType type;

  @override
  Uri uri;

  XMLPersistence(this.type, this.uri) : assert(type == PersistenceType.xml) {
    created = DateTime.now();
    modified = DateTime.now();
    hidden = false;
    favourite = false;
  }

  factory XMLPersistence.fromJson(Map<String, dynamic> json) =>
      _$XMLPersistenceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$XMLPersistenceToJson(this);
}

@JsonSerializable()
class SQLitePersistence implements Persistence {
  @override
  late DateTime created;

  @override
  late bool favourite;

  @override
  late bool hidden;

  @override
  late DateTime modified;

  @override
  PersistenceType type;

  @override
  Uri uri;

  SQLitePersistence(this.type, this.uri)
      : assert(type == PersistenceType.sqlite) {
    created = DateTime.now();
    modified = DateTime.now();
    hidden = false;
    favourite = false;
  }

  factory SQLitePersistence.fromJson(Map<String, dynamic> json) =>
      _$SQLitePersistenceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SQLitePersistenceToJson(this);
}

@JsonSerializable()
class LocalPersistence implements Persistence {
  @override
  late DateTime created;

  @override
  late bool favourite;

  @override
  late bool hidden;

  @override
  late DateTime modified;

  @override
  PersistenceType type;

  @override
  late Uri uri;

  String sharedPreferencesKey;

  LocalPersistence(this.type, this.sharedPreferencesKey)
      : assert(type == PersistenceType.local) {
    uri = Uri();
    created = DateTime.now();
    modified = DateTime.now();
    hidden = false;
    favourite = false;
  }

  factory LocalPersistence.fromJson(Map<String, dynamic> json) =>
      _$LocalPersistenceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocalPersistenceToJson(this);
}
