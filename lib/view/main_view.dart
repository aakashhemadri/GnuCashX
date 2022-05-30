import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gnucashx/providers/providers.dart';
import 'package:gnucashx/view/view.dart';
import 'package:gnucashx/utils/utils.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Consumer<UIProvider>(
              builder: (_, value, __) => <Widget>[
                    const BookView(),
                    const BudgetView(),
                    const ReportView(),
                    const MoreView()
                  ][value.bottomNavIndex]),
        ),
        bottomNavigationBar:
            Consumer<UIProvider>(builder: (context, value, child) {
          return NavigationBar(
              selectedIndex: value.bottomNavIndex,
              onDestinationSelected: (index) => value.changeBottomNav(index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.book_outlined),
                    selectedIcon: Icon(Icons.book_rounded),
                    label: 'Book'),
                NavigationDestination(
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    selectedIcon: Icon(Icons.account_balance_wallet_rounded),
                    label: 'Budget'),
                NavigationDestination(
                    icon: Icon(Icons.pie_chart_outline),
                    selectedIcon: Icon(Icons.pie_chart_rounded),
                    label: 'Report'),
                NavigationDestination(
                    icon: Icon(Icons.more_horiz_outlined),
                    selectedIcon: Icon(Icons.pets_rounded),
                    label: 'More')
              ]);
        }));
  }
}
