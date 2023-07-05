import 'package:flutter/material.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// LastEditTime: 2022-07-22 12:12:46
/// FilePath: /flutter_application_1/lib/Page/widgets/animation/animations/tweens/rect_tween_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class RectTweenPage extends StatefulWidget {
  const RectTweenPage({Key? key}) : super(key: key);

  @override
  State<RectTweenPage> createState() => _RectTweenPageState();
}

class _RectTweenPageState extends State<RectTweenPage>
    with SingleTickerProviderStateMixin {
  late Animation<Rect?> rectAnim;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    /// 动画管理器
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    rectAnim = RectTween(
            begin: const Rect.fromLTWH(0, 0, 100, 100),
            end: const Rect.fromLTWH(200, 200, 200, 200))
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
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
            left: rectAnim.value?.left.toDouble(),
            top: rectAnim.value?.top.toDouble(),
            child: Image.asset(
              'images/top.jpeg',
              width: rectAnim.value?.width,
              height: rectAnim.value?.height,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
