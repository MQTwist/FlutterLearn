import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class UILayout extends StatefulWidget {
  const UILayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UILayoutState();
}

class UILayoutState extends State<UILayout> {
  List<String> dataArr = [
    'Row',
    'Column',
    'Expanded',
    'Container',
    'ListView',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI布局'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return _getRow(index);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.5,
              color: Colors.red,
            );
          },
          itemCount: dataArr.length),
    );
  }

  Widget _getRow(int index) {
    String title1 = (index + 1).toString() + '、' + dataArr[index];
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Text(
          title1,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      onTap: () {
        _pushPage(index);
      },
    );
  }

  _pushPage(int index) {
    String route = dataArr[index];
    Get.toNamed(route);
  }
}
