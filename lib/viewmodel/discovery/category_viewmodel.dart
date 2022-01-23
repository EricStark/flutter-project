

import 'package:first_flutter/http/http_manager.dart';
import 'package:first_flutter/http/url.dart';
import 'package:first_flutter/model/discovery/category_model.dart';
import 'package:first_flutter/utils/toast_util.dart';
import 'package:first_flutter/viewmodel/base_viewmodel.dart';
import 'package:first_flutter/widget/loading_state_widget.dart';

class CategoryViewModel extends BaseViewModel {
  List<CategoryModel> list = [];

  @override
  void refresh() async {
    HttpManager.getData(
      Url.categoryUrl,
      success: (result) {
        list = (result as List)
            .map((model) => CategoryModel.fromJson(model))
            .toList();
        viewState = ViewState.done;
      },
      fail: (e) {
        MSGToast.showError(e.toString());
        viewState = ViewState.error;
      },
      complete: () => notifyListeners(),
    );
  }
}