import 'package:first_flutter/http/url.dart';
import 'package:first_flutter/model/common_item.dart';
import 'package:first_flutter/viewmodel/base_list_viewmodel.dart';

class FollowViewModel extends BaseListViewModel<Item, Issue> {
  @override
  String getUrl() {
    return Url.followUrl;
  }

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }
}
