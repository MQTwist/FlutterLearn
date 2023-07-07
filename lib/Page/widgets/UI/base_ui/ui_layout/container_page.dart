import 'package:flutter/material.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2022-04-29 14:17:43
/// FilePath: /flutter_application_1/lib/Page/widgets/UILayout/container_page.dart
///
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _container(),
          const SizedBox(height: 10),
          _container1(),
        ],
      ),
    );
  }

  _container() {
    return Container(
      height: 100,
      color: Colors.red,
    );
  }

  _container1() {
    return Container(
      height: 100,
      color: Colors.red,
      child: const Text('子组件影响Container大小'),
    );
  }
}
