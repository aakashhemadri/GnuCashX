import 'package:flutter/material.dart';

import 'package:gnucashx/routes/routes.dart';
import 'package:gnucashx/widget/widget.dart';
import 'package:gnucashx/utils/utils.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Icon(
              Icons.attach_money_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(
              title: Text(G.of(context)!.moreSettingsTile),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_forward_rounded),
              enableFeedback: true,
              onTap: () =>
                  Navigator.of(context).pushNamed(RouteManager.settingsPage),
            ),
            ListTile(
              title: Text(G.of(context)!.moreAboutTile),
              leading: const Icon(Icons.help),
              trailing: const Icon(Icons.arrow_forward_rounded),
              enableFeedback: true,
              onTap: () =>
                  Navigator.of(context).pushNamed(RouteManager.aboutPage),
            ),
            kWidgetDivider,
            ListTile(
                title: Text(G.of(context)!.morePingMe),
                leading: const Icon(Icons.notifications_rounded),
                onTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(kWidgetSnackBarPing)),
          ]),
        ),
      ],
    );
  }
}
