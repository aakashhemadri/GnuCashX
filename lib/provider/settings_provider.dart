part of provider;

class SettingsProvider with ChangeNotifier {
  final SettingsRepo _settingsRepo = SettingsRepo();
  Settings _settings = Settings.local();

  Future<bool> init() {
    // ignore: unnecessary_null_comparison
    if (_settings == null) {
      return _settingsRepo
          .read()
          .then((settings) => _settings = settings)
          .then((value) => Future.value(true));
    } else {
      return Future.value(true);
    }
  }

  Future<bool> _commit() {
    return _settingsRepo.write(settings);
  }

  Settings get settings => _settings;

  Future<bool> addSource(Persistence source) {
    _settings = settings.copyWith(sources: [...settings.sources, source]);
    notifyListeners();
    return _commit();
  }

  Future<bool> removeSource(Persistence source) {
    _settings =
        settings.copyWith(sources: settings.sources.toList()..remove(source));
    notifyListeners();
    return _commit();
  }

  Future<bool> updateTheme(ThemeMode theme) {
    _settings = settings.copyWith(theme: theme);
    notifyListeners();
    return _commit();
  }
}
