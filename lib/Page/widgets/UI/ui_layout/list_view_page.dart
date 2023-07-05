import 'package:flutter/material.dart';

/// ---
/// Description: listView
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// Date: 2022-11-18 09:54:54
/// LastEditTime: 2022-11-18 10:16:45
/// FilePath: /flutter_application_1/lib/Page/widgets/UI/ui_layout/list_view_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewPage'),
      ),
      body: _listViewSeparated(),
    );
  }

  _listView() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: const <Widget>[
        Text('张三'),
        Text('李四'),
        Text('王五'),
        Text('赵六'),
      ],
    );
  }

  _listViewBuild() {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("_listViewBuild $index"));
        });
  }

  _listViewSeparated() {
    // widget预定义以供复用。
    Widget blue = Container(color: Colors.blue, height: 10);
    Widget red = Container(color: Colors.red, height: 10);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? blue : red;
      },
    );
  }
}
