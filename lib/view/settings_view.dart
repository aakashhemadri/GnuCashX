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
      appBar: AppBar(title: const Text('Settings')),
      body: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) => ListView(
          children: [
            const ListTile(
              title: Text('Sources'),
              enabled: false,
              dense: true,
            ),
            ListTile(
              enabled: false,
              title: const Text('Current GnuCash Book'),
              subtitle: Builder(builder: (context) {
                if (settingsProvider.settings.current == null) {
                  return const Text('No sources available, tap to create.');
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
            const ListTile(
              title: Text('Appearance'),
              enabled: false,
              dense: true,
            ),
            ListTile(
              title: const Text('Dark Mode'),
              subtitle: Builder(builder: (context) {
                switch (settingsProvider.settings.theme) {
                  case ThemeMode.system:
                    return const Text('Follow system');
                  case ThemeMode.light:
                    return const Text('Light');
                  case ThemeMode.dark:
                    return const Text('Dark');
                }
              }),
              onTap: () async => await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Select Theme'),
                      children: <Widget>[
                        SimpleDialogOption(
                          child: const Text('Follow system'),
                          onPressed: () => Navigator.pop(context,
                              settingsProvider.updateTheme(ThemeMode.system)),
                        ),
                        SimpleDialogOption(
                          child: const Text('Light'),
                          onPressed: () => Navigator.pop(context,
                              settingsProvider.updateTheme(ThemeMode.light)),
                        ),
                        SimpleDialogOption(
                          child: const Text('Dark'),
                          onPressed: () => Navigator.pop(context,
                              settingsProvider.updateTheme(ThemeMode.dark)),
                        ),
                      ],
                    );
                  }),
            ),
            SwitchListTile(
                title: const Text('Dynamic Theme'),
                value: settingsProvider.settings.isDynamic,
                onChanged: (toggle) =>
                    settingsProvider.switchDynamicTheme(toggle)),
            kWidgetDivider,
            const ListTile(
              title: Text('EXPERIMENTAL'),
              subtitle: Text('Unstable options, use with discretion.'),
              enabled: false,
              dense: true,
            ),
            SwitchListTile(
                title: const Text('MaterialYou'),
                subtitle: const Text('Enable Android S+ Theming'),
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
