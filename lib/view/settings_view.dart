import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gnucashx/widget/widget.dart';
import 'package:gnucashx/providers/providers.dart';
import 'package:gnucashx/data/data.dart';
import 'package:gnucashx/utils/utils.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) => ListView(
          children: [
            ListTile(
              title: Text(context.l10n.settingsSourcesHeader),
              enabled: false,
              dense: true,
            ),
            ListTile(
              enabled: false,
              title: Text(context.l10n.settingsSourcesTitle),
              subtitle: Builder(builder: (context) {
                if (settingsProvider.settings.current == null) {
                  return Text(context.l10n.settingsSourcesSubtitle);
                } else {
                  return Text(settingsProvider.settings.current!.map(
                      local: (Local value) => value.key,
                      xml: (XML value) => value.uri.toString(),
                      sqlite: (SQLite value) => value.uri.toString()));
                }
              }),
              minLeadingWidth: kStyleMinLeadingWidth,
              leading: const SizedBox(
                  height: double.infinity, child: Icon(Icons.file_open)),
            ),
            kWidgetDivider,
            ListTile(
              title: Text(context.l10n.settingsIntlHeader),
              enabled: false,
              dense: true,
            ),
            SwitchListTile(
                title: Text(context.l10n.settingsIntlSystemLocaleTitle),
                subtitle: Text(context.l10n.settingsIntlSystemLocaleSubtitle),
                value: settingsProvider.settings.useSystemLocale,
                onChanged: (toggle) =>
                    settingsProvider.switchSystemLocale(toggle)),
            ListTile(
                enabled: !settingsProvider.settings.useSystemLocale,
                title: Text(context.l10n.settingsIntlLanguageTitle),
                subtitle: Text(context.l10n.settingsIntlLanguageSubtitle),
                minLeadingWidth: kStyleMinLeadingWidth,
                leading: const SizedBox(
                    height: double.infinity,
                    child: Icon(Icons.language_rounded)),
                trailing: Text(settingsProvider.settings.localeLanguageCode)),
            ListTile(
              enabled: !settingsProvider.settings.useSystemLocale,
              title: Text(context.l10n.settingsIntlCountryTitle),
              subtitle: Text(context.l10n.settingsIntlCountrySubtitle),
              minLeadingWidth: kStyleMinLeadingWidth,
              leading: const SizedBox(
                  height: double.infinity,
                  child: Icon(Icons.location_city_rounded)),
              trailing: Text(settingsProvider.settings.localeCountryCode),
            ),
            kWidgetDivider,
            ListTile(
              title: Text(context.l10n.settingsAppearenceHeader),
              enabled: false,
              dense: true,
            ),
            ListTile(
              title: Text(context.l10n.settingsAppearenceThemeModeTitle),
              subtitle: Builder(builder: (context) {
                switch (settingsProvider.settings.theme) {
                  case ThemeMode.system:
                    return Text(
                        context.l10n.settingsAppearenceThemeModeSystem);
                  case ThemeMode.light:
                    return Text(
                        context.l10n.settingsAppearenceThemeModeLight);
                  case ThemeMode.dark:
                    return Text(context.l10n.settingsAppearenceThemeModeDark);
                }
              }),
              onTap: () => showDialog<void>(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return SimpleDialog(
                      title: Text(dialogContext.l10n.settingsAppearenceDialogTitle),
                      children: <Widget>[
                        SimpleDialogOption(
                          child: Text(
                              dialogContext.l10n.settingsAppearenceThemeModeSystem),
                          onPressed: () => Navigator.pop(dialogContext,
                              settingsProvider.updateTheme(ThemeMode.system)),
                        ),
                        SimpleDialogOption(
                          child: Text(
                              dialogContext.l10n.settingsAppearenceThemeModeLight),
                          onPressed: () => Navigator.pop(dialogContext,
                              settingsProvider.updateTheme(ThemeMode.light)),
                        ),
                        SimpleDialogOption(
                          child: Text(
                              dialogContext.l10n.settingsAppearenceThemeModeDark),
                          onPressed: () => Navigator.pop(dialogContext,
                              settingsProvider.updateTheme(ThemeMode.dark)),
                        ),
                      ],
                    );
                  }),
            ),
            SwitchListTile(
                title: Text(context.l10n.settingsAppearenceDynamicTheme),
                value: settingsProvider.settings.isDynamic,
                onChanged: (toggle) =>
                    settingsProvider.switchDynamicTheme(toggle)),
            kWidgetDivider,
            ListTile(
              title: Text(context.l10n.settingsExperimentalHeader),
              subtitle: Text(context.l10n.settingsExperimentalHeaderSubtitle),
              enabled: false,
              dense: true,
            ),
            SwitchListTile(
                title: Text(context.l10n.settingsExperimentalMaterial3Title),
                subtitle:
                    Text(context.l10n.settingsExperimentalMaterial3Subtitle),
                value: settingsProvider.settings.useMaterial3,
                onChanged: (toggle) =>
                    settingsProvider.switchMaterialVersion(toggle)),
            kWidgetDivider,
          ],
        ),
      ),
    );
  }
}
