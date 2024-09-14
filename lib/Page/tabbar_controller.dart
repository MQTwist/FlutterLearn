/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2023-06-30 10:40:01
/// LastEditors: MQTwist
/// LastEditTime: 2023-07-07 18:40:40
/// FilePath: /flutter/lib/Page/tabbar_controller.dart
/// Copyright © 2023 by MQTwist, All Rights Reserved.
/// ---
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/widgets/algorithm/algorithm_page.dart';
import 'package:flutter_application_1/page/widgets/ui/ui_page.dart';
import 'package:flutter_application_1/page/widgets/home/HomePage.dart';
import 'package:flutter_application_1/page/widgets/me/me_page.dart';
import 'package:flutter_application_1/page/widgets/state/state_page.dart';

class TabbarController extends StatefulWidget {
  const TabbarController({Key? key}) : super(key: key);
  @override
  State<TabbarController> createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  int _selectedIndex = 0;
  List<Widget> pages = <Widget>[
    const HomePage(),
    const UIPage(),
    const StatePage(),
    const AlgorithmPage(),
    const MePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
        sizing: StackFit.expand,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: 'UI'),
          BottomNavigationBarItem(icon: Icon(Icons.manage_history), label: '状态'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: '算法'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
