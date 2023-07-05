import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_page.dart';
import 'package:flutter_application_1/Page/widgets/animation/animation_page.dart';
import 'package:flutter_application_1/Page/widgets/home/HomePage.dart';
import 'package:flutter_application_1/Page/widgets/me/me_page.dart';

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
    const AnimationPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: '动画'),
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
