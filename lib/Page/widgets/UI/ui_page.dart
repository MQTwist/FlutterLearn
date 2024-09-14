import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/base_ui_home.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animation_page.dart';

class UIPage extends StatelessWidget {
  const UIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("UI"),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.draw), text: 'BaseUI'),
              Tab(icon: Icon(Icons.animation), text: '动画'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BaseUiHome(),
            AnimationPage(),
          ],
        ),
      ),
    );
  }
}
