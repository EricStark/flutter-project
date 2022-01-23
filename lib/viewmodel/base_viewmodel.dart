//分页模型抽取

import 'package:first_flutter/viewmodel/base_change_notifier.dart';
import 'package:first_flutter/widget/loading_state_widget.dart';

abstract class BaseViewModel extends BaseChangNotifier {

  // 获取数据
  void refresh(){}

  void loadMore(){}

  //错误重试
  void retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}