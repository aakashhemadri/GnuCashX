import 'package:flutter/material.dart';

import 'package:gnucashx/utils/utils.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(G.of(context)!.reportTitle)),
      body: Center(
        child: Icon(
          Icons.thunderstorm_rounded,
          size: 70,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
