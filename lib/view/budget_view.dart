import 'package:flutter/material.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budgeting')),
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
