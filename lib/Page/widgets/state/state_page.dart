import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/widgets/state/bloc/bloc_page.dart';
import 'package:flutter_application_1/Page/widgets/state/provider/provider_page.dart';
import 'package:flutter_application_1/Page/widgets/state/stream/stream_page.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2023-07-07 18:34:39
/// LastEditors: MQTwist
/// LastEditTime: 2023-07-07 18:44:01
/// FilePath: /flutter/lib/Page/widgets/state/state_page.dart
/// Copyright © 2023 by MQTwist, All Rights Reserved.
/// ---

class StatePage extends StatelessWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("状态"),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.production_quantity_limits), text: 'Provider'),
              Tab(icon: Icon(Icons.stream), text: 'Stream'),
              Tab(icon: Icon(Icons.block), text: 'Bloc'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProviderPage(),
            StreamPage(),
            BlocPage(),
          ],
        ),
      ),
    );
  }
}
