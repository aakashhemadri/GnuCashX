import 'package:flutter/material.dart';

import 'package:gnucashx/utils/utils.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(G.of(context)!.budgetTitle)),
      body: Center(
        child: Icon(
          Icons.cloudy_snowing,
          size: 70,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
