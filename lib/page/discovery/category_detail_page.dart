import 'package:first_flutter/model/common_item.dart';
import 'package:first_flutter/model/discovery/category_model.dart';
import 'package:first_flutter/state/base_list_state.dart';
import 'package:first_flutter/utils/cache_image.dart';
import 'package:first_flutter/utils/navigator_util.dart';
import 'package:first_flutter/viewmodel/discovery/category_detail_viewmodel.dart';
import 'package:first_flutter/widget/list_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryDetailPage({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState
    extends BaseListState<Item, CategoryDetailViewModel, CategoryDetailPage> {
  @override
  void init() {
    // 设置不能下拉刷新
    enablePullDown = false;
  }

  @override
  CategoryDetailViewModel get viewModel {
    return CategoryDetailViewModel(widget.categoryModel.id!);
  }

  @override
  Widget getContentChild(CategoryDetailViewModel model) {
    return CustomScrollView(
      slivers: [
        _sliverAppBar(),
        _sliverList(model),
      ],
    );
  }

  /// Head
  Widget _sliverAppBar() {
    return SliverAppBar(
      // 左侧控件，通常情况下为"返回"图标
      leading: GestureDetector(
          // TODO:跳转 detail
          onTap: () => back(),
          child: Icon(Icons.arrow_back, color: Colors.black)),
      // 阴影
      elevation: 0,
      // 亮度
      brightness: Brightness.light,
      // 背景色
      backgroundColor: Colors.white,
      // 展开区域的高度
      expandedHeight: 200.0,
      // 设置为true时，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态
      pinned: true,
      // 展开和折叠区域
      flexibleSpace: _flexibleSpace(),
    );
  }

  /// 弹性空间
  Widget _flexibleSpace() {
    return LayoutBuilder(
      builder: (context, constraints) {
        changeExpendStatus(
          (MediaQuery.of(context).padding.top).toInt() + 56,
          constraints.biggest.height.toInt(),
        );
        return FlexibleSpaceBar(
          title: Text(
            widget.categoryModel.name!,
            style: TextStyle(color: isExpend ? Colors.white : Colors.black),
          ),
          centerTitle: false,
          background: cacheImage(widget.categoryModel.headerImage!),
        );
      },
    );
  }

  // 判断是否展开，从而改变字体颜色
  bool isExpend = true;

  void changeExpendStatus(int statusBarHeight, int offset) {
    if (offset > statusBarHeight && offset < 250) {
      if (!isExpend) {
        isExpend = true;
      }
    } else {
      if (isExpend) {
        isExpend = false;
      }
    }
  }

  /// 内容列表
  Widget _sliverList(model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListItemWidget(
              item: model.itemList[index],
              showCategory: false,
              showDivider: false);
        },
        childCount: model.itemList.length,
      ),
    );
  }
}
