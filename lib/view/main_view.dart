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
              destinations: [
                NavigationDestination(
                    icon: const Icon(Icons.book_outlined),
                    selectedIcon: const Icon(Icons.book_rounded),
                    label: G.of(context)!.mainBookNav),
                NavigationDestination(
                    icon: const Icon(Icons.account_balance_wallet_outlined),
                    selectedIcon:
                        const Icon(Icons.account_balance_wallet_rounded),
                    label: G.of(context)!.mainBudgetNav),
                NavigationDestination(
                    icon: const Icon(Icons.pie_chart_outline),
                    selectedIcon: const Icon(Icons.pie_chart_rounded),
                    label: G.of(context)!.mainReportNav),
                NavigationDestination(
                    icon: const Icon(Icons.more_horiz_outlined),
                    selectedIcon: const Icon(Icons.pets_rounded),
                    label: G.of(context)!.mainMoreNav)
              ]);
        }));
  }
}
