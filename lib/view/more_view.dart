import 'package:flutter/material.dart';

import 'package:gnucashx/routes/routes.dart';
import 'package:gnucashx/widget/widget.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('More'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            kWidgetDivider,
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              enableFeedback: true,
              onTap: () =>
                  Navigator.of(context).pushNamed(RouteManager.settingsPage),
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.help),
              enableFeedback: true,
              onTap: () =>
                  Navigator.of(context).pushNamed(RouteManager.aboutPage),
            ),
            kWidgetDivider,
            ListTile(
                title: const Text('Ping Me!'),
                leading: const Icon(Icons.notifications_rounded),
                onTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kWidgetSnackBarPing)),
          ]),
        ),
      ],
    );
  }
}
