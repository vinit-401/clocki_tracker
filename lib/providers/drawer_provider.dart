import 'package:flutter/cupertino.dart';

class DrawerStateProvider with ChangeNotifier {
  int _selectedItemIndex = 0;

  int get selectedItemIndex => _selectedItemIndex;

  void changeSelectedIndex(int index) {
    _selectedItemIndex = index;
    notifyListeners();
  }
}
