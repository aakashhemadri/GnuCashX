import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
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
