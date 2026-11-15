import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'gnc_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of G
/// returned by `G.of(context)`.
///
/// Applications need to include `G.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/gnc_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: G.localizationsDelegates,
///   supportedLocales: G.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the G.supportedLocales
/// property.
abstract class G {
  G(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static G? of(BuildContext context) {
    return Localizations.of<G>(context, G);
  }

  static const LocalizationsDelegate<G> delegate = _GDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// GnuCashX is the app wide title, if unsure use as is
  ///
  /// In en, this message translates to:
  /// **'GnuCashX'**
  String get title;

  /// No description provided for @mainBookNav.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get mainBookNav;

  /// No description provided for @bookTitle.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get bookTitle;

  /// No description provided for @mainBudgetNav.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get mainBudgetNav;

  /// No description provided for @budgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Budgeting'**
  String get budgetTitle;

  /// No description provided for @mainReportNav.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get mainReportNav;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportTitle;

  /// No description provided for @mainMoreNav.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get mainMoreNav;

  /// No description provided for @morePingMe.
  ///
  /// In en, this message translates to:
  /// **'Ping Me!'**
  String get morePingMe;

  /// No description provided for @moreSettingsTile.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get moreSettingsTile;

  /// No description provided for @moreAboutTile.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get moreAboutTile;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// SettingsView AppBar title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Header to the internationalization section in settings
  ///
  /// In en, this message translates to:
  /// **'Internationalization'**
  String get settingsIntlHeader;

  /// Switch for using system's locale
  ///
  /// In en, this message translates to:
  /// **'Use System Locale'**
  String get settingsIntlSystemLocaleTitle;

  /// Explanation to the Title
  ///
  /// In en, this message translates to:
  /// **'Set correct currency and numeric formats'**
  String get settingsIntlSystemLocaleSubtitle;

  /// Dropdown to select language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsIntlLanguageTitle;

  /// Currently selected languageCode
  ///
  /// In en, this message translates to:
  /// **'Select language code'**
  String get settingsIntlLanguageSubtitle;

  /// No description provided for @settingsIntlCountryTitle.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get settingsIntlCountryTitle;

  /// Currently selected countryCode
  ///
  /// In en, this message translates to:
  /// **'Select country code'**
  String get settingsIntlCountrySubtitle;

  /// No description provided for @settingsSourcesHeader.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get settingsSourcesHeader;

  /// No description provided for @settingsSourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Current GnuCash Book'**
  String get settingsSourcesTitle;

  /// No description provided for @settingsSourcesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No sources available, tap to create'**
  String get settingsSourcesSubtitle;

  /// No description provided for @settingsAppearenceHeader.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearenceHeader;

  /// No description provided for @settingsAppearenceThemeModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsAppearenceThemeModeTitle;

  /// No description provided for @settingsAppearenceDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Theme'**
  String get settingsAppearenceDialogTitle;

  /// No description provided for @settingsAppearenceThemeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get settingsAppearenceThemeModeSystem;

  /// No description provided for @settingsAppearenceThemeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsAppearenceThemeModeLight;

  /// No description provided for @settingsAppearenceThemeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsAppearenceThemeModeDark;

  /// No description provided for @settingsAppearenceDynamicTheme.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Theme'**
  String get settingsAppearenceDynamicTheme;

  /// No description provided for @settingsExperimentalHeader.
  ///
  /// In en, this message translates to:
  /// **'EXPERIMENTAL'**
  String get settingsExperimentalHeader;

  /// No description provided for @settingsExperimentalHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unstable options, use with discretion'**
  String get settingsExperimentalHeaderSubtitle;

  /// No description provided for @settingsExperimentalMaterial3Title.
  ///
  /// In en, this message translates to:
  /// **'MaterialYou'**
  String get settingsExperimentalMaterial3Title;

  /// No description provided for @settingsExperimentalMaterial3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Android S+ Theming'**
  String get settingsExperimentalMaterial3Subtitle;

  /// No description provided for @placeholder.
  ///
  /// In en, this message translates to:
  /// **'Placeholder'**
  String get placeholder;
}

class _GDelegate extends LocalizationsDelegate<G> {
  const _GDelegate();

  @override
  Future<G> load(Locale locale) {
    return SynchronousFuture<G>(lookupG(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_GDelegate old) => false;
}

G lookupG(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return GEn();
  }

  throw FlutterError(
    'G.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
