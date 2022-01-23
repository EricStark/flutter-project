import 'package:first_flutter/http/http_manager.dart';
import 'package:first_flutter/http/url.dart';
import 'package:first_flutter/model/common_item.dart';
import 'package:first_flutter/utils/toast_util.dart';
import 'package:first_flutter/viewmodel/base_change_notifier.dart';
import 'package:first_flutter/widget/loading_state_widget.dart';

class VideoDetailViewModel extends BaseChangNotifier {
  List<Item> itemList = [];
  late int _videoId;

  void loadVideoData(int id) {
    _videoId = id;
    // https://baobab.kaiyanapp.com/api/v4/video/related?id=266986
    HttpManager.requestData('${Url.videoRelatedUrl}$id').then((res) {
      Issue issue = Issue.fromJson(res);
      itemList = issue.itemList;
      viewState = ViewState.done;
    }).catchError((e) {
      MSGToast.showError(e.toString());
      viewState = ViewState.error;
    }).whenComplete(() => notifyListeners());
  }

  void retry() {
    viewState = ViewState.loading;
    notifyListeners();
    loadVideoData(_videoId);
  }
}
