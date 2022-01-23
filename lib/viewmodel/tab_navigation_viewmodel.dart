import 'package:first_flutter/viewmodel/base_change_notifier.dart';

class TabNavigationViewModel extends BaseChangNotifier {
  int currentIndex = 0;

  void changeBottomTabIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
