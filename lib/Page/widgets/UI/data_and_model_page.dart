import 'package:flutter/material.dart';

/// ---
/// Description: 数据模型
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2023-06-30 11:00:21
/// LastEditors: MQTwist
/// LastEditTime: 2023-06-30 11:52:04
/// FilePath: /flutter/lib/Page/widgets/UI/data_and_model_page.dart
/// Copyright © 2023 by MQTwist, All Rights Reserved.
/// ---

class DataAndModelPage extends StatefulWidget {
  const DataAndModelPage({Key? key}) : super(key: key);

  @override
  State<DataAndModelPage> createState() => _DataAndModelPageState();
}

class _DataAndModelPageState extends State<DataAndModelPage> {
  List<UserModel> data = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      Map map = {'name': "name$i", "age": i + 2};
      UserModel userModel = UserModel.fromJson(map);
      data.add(userModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("数模转换"),
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        UserModel model = data[index];
        return _listItem(model.name, model.age);
      },
      itemCount: data.length,
      itemExtent: 40,
    );
  }

  Widget _listItem(String name, int age) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text("名字：$name"),
          const Expanded(child: SizedBox()),
          Text("年龄：$age"),
        ],
      ),
    );
  }
}

class UserModel {
  final String name;
  final int age;

  UserModel(
    this.name,
    this.age,
  );

  factory UserModel.fromJson(Map map) {
    return UserModel(map['name'] ?? '', map['age'] ?? 0);
  }
}
