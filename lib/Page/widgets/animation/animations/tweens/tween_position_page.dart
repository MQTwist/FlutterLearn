import 'package:flutter/material.dart';

/// ---
/// Description: 平移动画
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// LastEditTime: 2022-06-08 10:07:12
/// FilePath: /flutter_application_1/lib/Page/widgets/animation/animations/tweens/tween_position_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class TweenPositionPage extends StatefulWidget {
  const TweenPositionPage({Key? key}) : super(key: key);

  @override
  State<TweenPositionPage> createState() => _TweenPositionPageState();
}

class _TweenPositionPageState extends State<TweenPositionPage>
    with SingleTickerProviderStateMixin {
  late Animation<num> positionAnim;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    /// 动画管理器
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });

    positionAnim = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(controller);

    /// 启动动画(正向执行)
    controller.forward();
  }

  @override
  void dispose() {
    /// 路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> title =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(title['name']),
      ),
      body: Stack(
        children: [
          Positioned(
            left: positionAnim.value.toDouble(),
            child: Image.asset(
              'images/top.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }

  // Widget animateAlign(Widget widget, Rect fromRect, Rect toRect,
  //     {Curve curve = Curves.linear}) {
  //   return AnimatedAlign(
  //     curve: curve,
  //     child: InkWell(
  //       onTap: () {
  //         setState(() {});
  //       },
  //       child: widget,
  //     ),
  //     duration: const Duration(seconds: 1),
  //     alignment: _alignment,
  //   );
  // }

  // Offset calcRect(Rect fromRect, Rect toRect) {
  //   Offset centerDistance = toRect.center - fromRect.center;

  //   double width = MediaQueryData.fromWindow(window).size.width;
  //   double height = MediaQueryData.fromWindow(window).size.height - MediaQueryData.fromWindow(window).padding.top;

  // }
}
