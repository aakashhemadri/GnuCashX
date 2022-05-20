part of provider;

enum BottomNav { book, budget, report, more }

class UIProvider with ChangeNotifier {
  int bottomNavIndex = 0;

  void changeBottomNav(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }
}
