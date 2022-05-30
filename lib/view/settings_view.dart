import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gnucashx/widget/widget.dart';
import 'package:gnucashx/providers/providers.dart';
import 'package:gnucashx/data/data.dart';
import 'package:gnucashx/utils/utils.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(G.of(context)!.settingsTitle)),
      body: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) => ListView(
          children: [
            ListTile(
              title: Text(G.of(context)!.settingsSourcesHeader),
              enabled: false,
              dense: true,
            ),
            ListTile(
              enabled: false,
              title: Text(G.of(context)!.settingsSourcesTitle),
              subtitle: Builder(builder: (context) {
                if (settingsProvider.settings.current == null) {
                  return Text(G.of(context)!.settingsSourcesSubtitle);
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
              title: Text(G.of(context)!.settingsIntlHeader),
              enabled: false,
              dense: true,
            ),
            SwitchListTile(
                title: Text(G.of(context)!.settingsIntlSystemLocaleTitle),
                subtitle: Text(G.of(context)!.settingsIntlSystemLocaleSubtitle),
                value: settingsProvider.settings.useSystemLocale,
                onChanged: (toggle) =>
                    settingsProvider.switchSystemLocale(toggle)),
            ListTile(
                enabled: !settingsProvider.settings.useSystemLocale,
                title: Text(G.of(context)!.settingsIntlLanguageTitle),
                subtitle: Text(G.of(context)!.settingsIntlLanguageSubtitle),
                minLeadingWidth: kStyleMinLeadingWidth,
                leading: const SizedBox(
                    height: double.infinity,
                    child: Icon(Icons.language_rounded)),
                trailing: Text(settingsProvider.settings.localeLanguageCode)),
            ListTile(
              enabled: !settingsProvider.settings.useSystemLocale,
              title: Text(G.of(context)!.settingsIntlCountryTitle),
              subtitle: Text(G.of(context)!.settingsIntlCountrySubtitle),
              minLeadingWidth: kStyleMinLeadingWidth,
              leading: const SizedBox(
                  height: double.infinity,
                  child: Icon(Icons.location_city_rounded)),
              trailing: Text(settingsProvider.settings.localeCountryCode),
            ),
            kWidgetDivider,
            ListTile(
              title: Text(G.of(context)!.settingsAppearenceHeader),
              enabled: false,
              dense: true,
            ),
            ListTile(
              title: Text(G.of(context)!.settingsAppearenceThemeModeTitle),
              subtitle: Builder(builder: (context) {
                switch (settingsProvider.settings.theme) {
                  case ThemeMode.system:
                    return Text(
                        G.of(context)!.settingsAppearenceThemeModeSystem);
                  case ThemeMode.light:
                    return Text(
                        G.of(context)!.settingsAppearenceThemeModeLight);
                  case ThemeMode.dark:
                    return Text(G.of(context)!.settingsAppearenceThemeModeDark);
                }
              }),
              onTap: () async => await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text(G.of(context)!.settingsAppearenceDialogTitle),
                      children: <Widget>[
                        SimpleDialogOption(
                          child: Text(
                              G.of(context)!.settingsAppearenceThemeModeSystem),
                          onPressed: () => Navigator.pop(context,
                              settingsProvider.updateTheme(ThemeMode.system)),
                        ),
                        SimpleDialogOption(
                          child: Text(
                              G.of(context)!.settingsAppearenceThemeModeLight),
                          onPressed: () => Navigator.pop(context,
                              settingsProvider.updateTheme(ThemeMode.light)),
                        ),
                        SimpleDialogOption(
                          child: Text(
                              G.of(context)!.settingsAppearenceThemeModeDark),
                          onPressed: () => Navigator.pop(context,
                              settingsProvider.updateTheme(ThemeMode.dark)),
                        ),
                      ],
                    );
                  }),
            ),
            SwitchListTile(
                title: Text(G.of(context)!.settingsAppearenceDynamicTheme),
                value: settingsProvider.settings.isDynamic,
                onChanged: (toggle) =>
                    settingsProvider.switchDynamicTheme(toggle)),
            kWidgetDivider,
            ListTile(
              title: Text(G.of(context)!.settingsExperimentalHeader),
              subtitle: Text(G.of(context)!.settingsExperimentalHeaderSubtitle),
              enabled: false,
              dense: true,
            ),
            SwitchListTile(
                title: Text(G.of(context)!.settingsExperimentalMaterial3Title),
                subtitle:
                    Text(G.of(context)!.settingsExperimentalMaterial3Subtitle),
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
