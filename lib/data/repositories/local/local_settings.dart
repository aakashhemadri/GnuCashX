import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:gnucashx/data/models/models.dart';
import 'package:gnucashx/data/repositories/repositories.dart';
import 'package:gnucashx/utils/constants.dart';

class LocalSettingsRepo implements SettingsRepo {
  @override
  Future<bool> reset() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String settings = jsonEncode(Settings.local());
    return pref.setString(kLocalSettingsKey, settings);
  }

  @override
  Future<bool> write(Settings settings) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String settingsJson = jsonEncode(settings.toJson());
    return pref.setString(kLocalSettingsKey, settingsJson);
  }

  @override
  Future<Settings> read() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? settingsJson = pref.getString(kLocalSettingsKey);
    if (settingsJson == null) {
      await reset();
      return Settings.local();
    }
    Map<String, dynamic> json =
        jsonDecode(settingsJson) as Map<String, dynamic>;
    return Settings.fromJson(json);
  }

  @override
  Future<bool> backup() {
    throw UnimplementedError();
  }

  @override
  Future<bool> restore(Settings settings) {
    throw UnimplementedError();
  }

  @override
  Future<bool> sync(Settings settings) {
    throw UnimplementedError();
  }
}
