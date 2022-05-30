part of providers;

class SettingsProvider with ChangeNotifier {
  final SettingsRepo _settingsRepo = SettingsRepo();
  Settings _settings = Settings.local();

  Future<bool> init() {
    return findSystemLocale().then((locale) => _settingsRepo
        .read()
        .then((settings) => _settings = settings)
        .then((value) => Future.value(true)));
  }

  Future<bool> reset() {
    return _settingsRepo.reset();
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

  Future<bool> switchDynamicTheme(bool isDynamic) {
    _settings = settings.copyWith(isDynamic: isDynamic);
    notifyListeners();
    return _commit();
  }

  Future<bool> switchMaterialVersion(bool useMaterial3) {
    _settings = settings.copyWith(useMaterial3: useMaterial3);
    notifyListeners();
    return _commit();
  }

  Future<bool> switchSystemLocale(bool useSystemLocale) {
    if (useSystemLocale == true) {
      _settings = settings.copyWith(
        useSystemLocale: useSystemLocale,
        localeLanguageCode: Intl.systemLocale.split('_')[0],
        localeCountryCode: Intl.systemLocale.split('_')[1],
      );
    } else {
      _settings = settings.copyWith(useSystemLocale: useSystemLocale);
    }
    notifyListeners();
    return _commit();
  }
}
