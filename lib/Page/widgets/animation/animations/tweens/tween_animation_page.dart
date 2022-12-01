import 'package:flutter/material.dart';

/// ---
/// Description: 补间动画，主要使用（AnimationController，Animation）实现
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// LastEditTime: 2022-06-07 13:37:42
/// FilePath: /flutter_application_1/lib/Page/widgets/animation/animations/tweens/tween_animation_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationPage> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage> {
  List<String> dataArr = [
    '补间平移',
    '补间缩放',
    '补间混合',
    'RectTween',
    'Demo',
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> title =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(title['name']),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return _row(index);
        },
        itemCount: dataArr.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0.1,
            color: Colors.blue,
          );
        },
      ),
    );
  }

  Widget _row(int index) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              dataArr[index],
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      onTap: () {
        _pushPage(index);
      },
    );
  }

  _pushPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(
          'TweenPosition',
          arguments: {'name': dataArr[index]},
        );
        break;
      case 1:
        Navigator.of(context).pushNamed(
          'TweenScale',
          arguments: {'name': dataArr[index]},
        );
        break;
      case 2:
        Navigator.of(context).pushNamed(
          'TweenMix',
          arguments: {'name': dataArr[index]},
        );
        break;
      case 3:
        Navigator.of(context).pushNamed(
          'TweenRect',
          arguments: {'name': dataArr[index]},
        );
        break;
      default:
        Navigator.of(context).pushNamed(
          'animTest',
          arguments: {'name': dataArr[index]},
        );
    }
  }
}
