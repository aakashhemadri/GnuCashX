import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accounts')),
      body: Center(
        child: Icon(
          Icons.pets_rounded,
          size: 70,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
