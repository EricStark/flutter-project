import 'package:first_flutter/http/url.dart';
import 'package:first_flutter/model/discovery/topic_model.dart';
import 'package:first_flutter/viewmodel/base_list_viewmodel.dart';

class TopicPageViewModel extends BaseListViewModel<TopicItemModel, TopicModel> {
  @override
  String getUrl() {
    return Url.topicsUrl;
  }

  @override
  TopicModel getModel(Map<String, dynamic> json) {
    return TopicModel.fromJson(json);
  }
}
