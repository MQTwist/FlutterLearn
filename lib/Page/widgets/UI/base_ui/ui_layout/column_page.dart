import 'package:flutter/material.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2022-04-28 18:19:19
/// FilePath: /flutter_application_1/lib/Page/widgets/UILayout/column_page.dart
///
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class ColumnPage extends StatelessWidget {
  const ColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column'),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          // 默认值
          mainAxisAlignment: MainAxisAlignment.start,
          // 默认值
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Expanded(child: Text("see")),
            Text("you"),
            Text("again"),
          ],
        ),
      ),
    );
  }
}
