import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/page/model/me/me_model.dart';
import 'package:flutter_application_1/page/widgets/me/views/black_view.dart';

class BlackListPage extends StatefulWidget {
  const BlackListPage({Key? key}) : super(key: key);

  @override
  State<BlackListPage> createState() => _BlackListPageState();
}

class _BlackListPageState extends State<BlackListPage> {
  MeModel? model;

  @override
  void initState() {
    rootBundle.loadString('resources/black_list.json').then((value) {
      var data = jsonDecode(value);
      debugPrint(data.toString());
      model = MeModel.fromJson(data);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> title = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(title['name']),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BlackView(item: model?.data[index] ?? MeItem('1', 'name', 'url', 0));
        },
        itemCount: model?.data.length,
      ),
    );
  }
}
