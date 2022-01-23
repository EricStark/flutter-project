import 'package:first_flutter/config/color.dart';
import 'package:first_flutter/config/string.dart';
import 'package:flutter/material.dart';

enum ViewState { loading, done, error }

class LoadingStateWidget extends StatelessWidget {
  final ViewState viewState; //首页的状态
  final VoidCallback retry; //重试方法
  final Widget child; //child

  LoadingStateWidget(
      {Key? key,
      this.viewState = ViewState.loading,
      required this.retry,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewState == ViewState.loading) {
      return _loadView;
    } else if (viewState == ViewState.error) {
      return _errorView;
    } else {
      return child;
    }
  }

  Widget get _errorView {
    return Center(
      // 类似LinearLayout
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/ic_error.png',
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              ConstString.net_request_fail,
              style: TextStyle(color: ConstColor.hitTextColor, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: OutlinedButton(
              onPressed: retry,
              child: Text(
                ConstString.reload_again,
                style: TextStyle(color: Colors.black87),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.black12)),
            ),
          )
        ],
      ),
    );
  }

  Widget get _loadView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
