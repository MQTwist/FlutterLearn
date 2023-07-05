import 'package:flutter/material.dart';

/// ---
/// Description: 补间混合
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// LastEditTime: 2022-05-31 18:49:40
/// FilePath: /flutter_application_1/lib/Page/widgets/animation/animations/tweens/tween_mix_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class TweenMixPage extends StatefulWidget {
  const TweenMixPage({Key? key}) : super(key: key);

  @override
  State<TweenMixPage> createState() => _TweenMixPageState();
}

class _TweenMixPageState extends State<TweenMixPage>
    with SingleTickerProviderStateMixin {
  late Animation<num> positionAnim;
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

    /// 位移
    positionAnim = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    /// 缩放
    scaleAnim = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: AnimatedBuilder(
        builder: _buildAnimation,
        animation: controller,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, child) {
    return Stack(
      children: [
        Positioned(
          left: positionAnim.value.toDouble(),
          top: positionAnim.value.toDouble(),
          child: Image.asset(
            'images/top.jpeg',
            width: scaleAnim.value.toDouble(),
            height: scaleAnim.value.toDouble(),
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
