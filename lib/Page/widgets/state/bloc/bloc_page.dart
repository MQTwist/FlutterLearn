import 'dart:async';

import 'package:flutter/material.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2023-07-07 18:39:12
/// LastEditors: MQTwist
/// LastEditTime: 2023-07-07 18:51:47
/// FilePath: /flutter/lib/Page/widgets/state/bloc/bloc_page.dart
/// Copyright © 2023 by MQTwist, All Rights Reserved.
/// ---

class BlocPage extends StatelessWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("BlocPage"));
  }
}

class Bloc {
  /// 创建StreamController
  final StreamController _streamController = StreamController<int>();
  StreamSink get counter => _streamController.sink;
}
