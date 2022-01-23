import 'package:first_flutter/model/common_item.dart';
import 'package:first_flutter/viewmodel/base_list_viewmodel.dart';

class HotListViewModel extends BaseListViewModel<Item, Issue> {
  String apiUrl;

  HotListViewModel(this.apiUrl);

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }

  @override
  String getUrl() {
    return apiUrl;
  }
}
