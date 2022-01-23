import 'package:first_flutter/viewmodel/base_change_notifier.dart';

class RecommendPhotoViewModel extends BaseChangNotifier {
  int currentIndex = 1;

  changeIndex(int index) {
    this.currentIndex = index + 1;
    notifyListeners();
  }
}
