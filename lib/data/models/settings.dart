import 'package:gnucashx/data/models/models.dart';
import 'package:gnucashx/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:gnucashx/utils/theme.dart';

part 'settings.g.dart';

@JsonSerializable()
class Settings extends Base {
  late GUID guid;
  static const fileName = 'gnucashx.config';
  late Theme theme;
  late String locale;
  late List<Persistence> source;
  late Persistence? recent;

  Settings.new(this.theme, this.locale, this.source, this.recent) {
    guid = GUID.generate();
  }

  Settings.local() {
    guid = GUID.generate();
    theme = Theme.light;
    locale = 'en_US';
    source = List<Persistence>.empty();
    source.add(Persistence(PersistenceType.local, kSettingsJsonKey));
    recent = source[0];
  }

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
