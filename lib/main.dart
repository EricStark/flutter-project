import 'dart:io';

import 'package:first_flutter/page/video/video_detail_page.dart';
import 'package:first_flutter/tab_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_init.dart';

void main() {
  runApp(MyApp());
  //Flutter沉浸式状态栏，Platform.isAndroid 判断是否是Android手机
  if (Platform.isAndroid) {
    // setSystemUIOverlayStyle:用来设置状态栏顶部和底部样式
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 异步UI更新
    return FutureBuilder(
      future: AppInit.init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        print("connectionState:${snapshot.connectionState}");
        var widget = snapshot.connectionState == ConnectionState.done
            ? TabNavigation() //显示的主页
            : Scaffold(body: Center(child: CircularProgressIndicator())); //菊花
        return MaterialAppWidget(child: widget); //将widget包裹上MaterialApp
      },
    );
  }
}

class MaterialAppWidget extends StatefulWidget {
  final Widget child;

  MaterialAppWidget({Key? key, required this.child}) : super(key: key);

  @override
  _MaterialAppWidgetState createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'EyePetizer',
    //   initialRoute: '/',
    //   routes: {
    //     '/': (BuildContext context) => widget.child,
    //   },
    // );
    return GetMaterialApp(
      title: 'EyePetizer',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => widget.child),
        GetPage(name: '/detail', page: () => VideoDetailPage()),
      ],
    );
  }
}
