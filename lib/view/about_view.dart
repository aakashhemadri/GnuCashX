import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
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
