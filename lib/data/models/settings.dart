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
      required bool useMaterial3,
      required bool isDynamic,
      required ThemeMode theme,
      required bool useSystemLocale,
      required String localeLanguageCode,
      required String localeCountryCode,
      required List<Persistence> sources,
      required Persistence? current}) = _Settings;

  factory Settings.local() => Settings._instance ??= Settings._(
      guid: GUID.generate(),
      useMaterial3: false,
      isDynamic: false,
      theme: ThemeMode.system,
      useSystemLocale: true,
      localeLanguageCode: Intl.systemLocale.split('_')[0],
      localeCountryCode: Intl.systemLocale.split('_')[1],
      sources: List<Persistence>.empty(),
      current: null);

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
