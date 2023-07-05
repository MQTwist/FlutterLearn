import 'package:flutter/material.dart';

/// ---
/// Description: 补间缩放
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// LastEditTime: 2022-05-31 18:38:45
/// FilePath: /flutter_application_1/lib/Page/widgets/animation/animations/tweens/tween_scale_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class TweenScalePage extends StatefulWidget {
  const TweenScalePage({Key? key}) : super(key: key);

  @override
  State<TweenScalePage> createState() => _TweenScalePageState();
}

class _TweenScalePageState extends State<TweenScalePage>
    with SingleTickerProviderStateMixin {
  late Animation<num> scaleAnim;
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
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    scaleAnim = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });

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
            child: Image.asset(
              'images/top.jpeg',
              width: scaleAnim.value.toDouble(),
              height: scaleAnim.value.toDouble(),
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
