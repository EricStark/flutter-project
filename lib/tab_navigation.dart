import 'package:first_flutter/page/discovery/discovery_page.dart';
import 'package:first_flutter/page/home/home_page.dart';
import 'package:first_flutter/page/hot/hot_page.dart';
import 'package:first_flutter/page/mine/MinePage.dart';
import 'package:first_flutter/utils/toast_util.dart';
import 'package:first_flutter/viewmodel/tab_navigation_viewmodel.dart';
import 'package:first_flutter/widget/provider_widget.dart';
import 'package:flutter/material.dart';

import 'config/string.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  late DateTime lastTime;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // 防止用户误碰
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          ///类似于Android的 ViewPager
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(), //首页
            DiscoveryPage(),
            HotPage(),
            MinePage(),
          ],
        ),
        bottomNavigationBar: ProviderWidget<TabNavigationViewModel>(
          model: TabNavigationViewModel(),
          builder: (context, model, child) {
            return BottomNavigationBar(
              currentIndex: model.currentIndex,
              // 固定title
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff000000),
              unselectedItemColor: Color(0xff9a9a9a),
              items: _item(),
              // index 值为0，1，2，3
              onTap: (index) {
                if (model.currentIndex != index) {
                  // 直接跳转不带动画，自动 setState
                  _pageController.jumpToPage(index);
                  // 更新model数据
                  model.changeBottomTabIndex(index);
                }
              },
            );
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _item() {
    return [
      _bottomItem(ConstString.home, 'images/ic_home_normal.png',
          'images/ic_home_selected.png'),
      _bottomItem(ConstString.discovery, 'images/ic_discovery_normal.png',
          'images/ic_discovery_selected.png'),
      _bottomItem(ConstString.hot, 'images/ic_hot_normal.png',
          'images/ic_hot_selected.png'),
      _bottomItem(ConstString.mine, 'images/ic_mine_normal.png',
          'images/ic_mine_selected.png'),
    ];
  }

  BottomNavigationBarItem _bottomItem(
      String title, String normalIcon, String selectorIcon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        normalIcon,
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        selectorIcon,
        width: 24,
        height: 24,
      ),
      label: title,
    );
  }

  Future<bool> _onWillPop() async {
    if (DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      MSGToast.showTip(ConstString.exit_tip);
      return false;
    } else {
      // 自动出栈
      return true;
    }
  }
}
