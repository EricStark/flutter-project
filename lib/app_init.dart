import 'package:first_flutter/http/Url.dart';
import 'package:first_flutter/utils/cache_manager.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

class AppInit {
  AppInit._();

  static Future<void> init() async {
    await CacheManager.preInit();

    ///初始化baseUrl
    Url.baseUrl = 'http://baobab.kaiyanapp.com/api/';
    Future.delayed(Duration(milliseconds: 2000), () {
      FlutterSplashScreen.hide();
    });
  }
}
