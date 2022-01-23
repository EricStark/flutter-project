import 'package:first_flutter/config/string.dart';
import 'package:first_flutter/page/home/home_body_page.dart';
import 'package:first_flutter/widget/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// AutomaticKeepAliveClientMixin作用：切换tab后保留tab的状态，避免initState方法重复调用
/// 1.需重写 wantKeepAlive 返回 true
/// 2.必须调用 super.build(context);
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBar(//首页的appbar
        ConstString.home,
        showBack: false,
      ),
      body: HomeBodyPage(),//首页的body
    );
  }

  @override
  bool get wantKeepAlive => true;
}
