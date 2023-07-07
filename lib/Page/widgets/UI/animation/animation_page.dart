import 'package:flutter/material.dart';

/// ---
/// Description: 动画集合
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: MQTwist
/// LastEditTime: 2023-07-07 18:30:09
/// FilePath: /flutter/lib/Page/widgets/animation/animation_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  List<String> dataArr = [
    '补间动画',
    '测试',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          'Tweens',
          arguments: {'name': dataArr[index]},
        );
        break;
      case 1:
        Navigator.of(context).pushNamed(
          'animTest',
          arguments: {'name': dataArr[index]},
        );
        break;
      default:
    }
  }
}
