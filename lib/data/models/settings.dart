import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'package:gnucashx/data/models/models.dart';
import 'package:gnucashx/utils/constants.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@Freezed()
class Settings extends Base with _$Settings {
  static const fileName = kSettingsFileName;
  static Settings? _instance;

  // Private Constructor
  const factory Settings._(
      {required GUID guid,
      required ThemeMode theme,
      required String locale,
      required List<Persistence> sources,
      required Persistence? current}) = _Settings;

  factory Settings.local() => Settings._instance ??= Settings._(
      guid: GUID.generate(),
      theme: ThemeMode.system,
      locale: Intl.systemLocale,
      sources: List<Persistence>.empty(),
      current: null);

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
