import 'package:flutter/material.dart';

import 'package:gnucashx/utils/utils.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(G.of(context)!.aboutTitle)),
      body: Center(
        child: Icon(
          Icons.help_rounded,
          size: 70,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
