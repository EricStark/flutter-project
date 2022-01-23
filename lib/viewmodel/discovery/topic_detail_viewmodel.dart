import 'package:first_flutter/http/http_manager.dart';
import 'package:first_flutter/http/url.dart';
import 'package:first_flutter/model/discovery/topic_detail_model.dart';
import 'package:first_flutter/utils/toast_util.dart';
import 'package:first_flutter/viewmodel/base_viewmodel.dart';
import 'package:first_flutter/widget/loading_state_widget.dart';

class TopicDetailViewModel extends BaseViewModel {
  TopicDetailModel topicDetailModel = TopicDetailModel();
  List<TopicDetailItemData> itemList = [];
  int _id;

  TopicDetailViewModel(this._id);

  @override
  void refresh() {
    // http://baobab.kaiyanapp.com/api/v3/lightTopics/internal/613
    HttpManager.requestData('${Url.topicsDetailUrl}$_id').then((res) {
      topicDetailModel = TopicDetailModel.fromJson(res);
      itemList = topicDetailModel.itemList!;
      viewState = ViewState.done;
    }).catchError((e) {
      MSGToast.showError(e.toString());
      viewState = ViewState.error;
    }).whenComplete(() => notifyListeners());
  }
}
