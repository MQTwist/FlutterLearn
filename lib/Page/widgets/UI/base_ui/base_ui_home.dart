import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2023-07-07 18:12:06
/// LastEditors: MQTwist
/// LastEditTime: 2023-07-07 18:18:20
/// FilePath: /flutter/lib/Page/widgets/UI/base_ui/base_ui_home.dart
/// Copyright © 2023 by MQTwist, All Rights Reserved.
/// ---

List<String> _dataArr = [
  '随机数',
  'UI布局',
  '蛋糕',
  'StatelessPage',
  'Swiper',
  'TextIconButton',
  'DataAndModelPage',
  'RepaintBoundaryPage',
];

class BaseUiHome extends StatelessWidget {
  const BaseUiHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _dataArr.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(context, position);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0.5,
          color: Colors.blue,
        );
      },
    );
  }

  Widget getRow(BuildContext context, int i) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(_dataArr[i]),
      ),
      onTap: () {
        _pushNewPage(context, i);
      },
    );
  }

  _pushNewPage(BuildContext context, int index) {
    String route = _dataArr[index];
    switch (index) {
      case 0:
        Get.toNamed('LikeNum');
        break;
      case 1:
        Get.toNamed('UI/H');
        break;
      case 2:
        Get.toNamed('Cake');
        break;
      case 3:
        Get.toNamed('Stateless');
        break;
      default:
        Get.toNamed(route);
    }
  }
}
