import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/models/models.dart';
import 'package:gnucashx/utils/constants.dart';
import 'package:gnucashx/utils/theme.dart';
import 'package:intl/intl.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@Freezed()
class Settings extends Base with _$Settings {
  static const fileName = kSettingsFileName;
  static Settings? _instance;

  // Private Constructor
  const factory Settings._(
      {required GUID guid,
      required Theme theme,
      required String locale,
      required List<Persistence> source,
      required Persistence? recent}) = _Settings;

  factory Settings.local() => Settings._instance ??= Settings._(
      guid: GUID.generate(),
      theme: Theme.light,
      locale: Intl.systemLocale,
      source: List<Persistence>.filled(
          1,
          Persistence.local(
              key: kSettingsLocalKey,
              favourite: true,
              hidden: false,
              created: DateTime.now(),
              modified: DateTime.now())),
      recent: null);

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
