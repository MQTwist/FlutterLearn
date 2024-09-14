/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2023-06-30 10:40:01
/// LastEditors: MQTwist
/// LastEditTime: 2023-07-07 18:32:09
/// FilePath: /flutter/lib/main.dart
/// Copyright © 2023 by MQTwist, All Rights Reserved.
/// ---
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/mq_router.dart';
import 'package:flutter_application_1/page/tabbar_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  /// 打开视觉调试开关
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
  testMethod();
}

testMethod() async {
  // FlutterNetworkReachability.instance.onConnectivityChanged.listen((event) {
  //   debugPrint(event.toString());
  //   switch (event) {
  //     case NetworkReachabilityResult.bluetooth:
  //       break;
  //     default:
  //   }
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        opaqueRoute: false,
        color: Colors.transparent,
        debugShowCheckedModeBanner: false,
        routes: MqRouter.routerMap,
        home: const TabbarController(),
        theme: ThemeData(appBarTheme: const AppBarTheme(scrolledUnderElevation: 0)),
      ),
    );
  }
}
