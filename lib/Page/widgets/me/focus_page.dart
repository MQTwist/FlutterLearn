import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Page/model/me/me_model.dart';
import 'package:flutter_application_1/Page/widgets/me/views/focus_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({Key? key}) : super(key: key);

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  MeModel? model;
  @override
  void initState() {
    rootBundle.loadString('resources/focus.json').then((value) {
      var data = jsonDecode(value);
      debugPrint(data.toString());
      model = MeModel.fromJson(data);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> title =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(title['name']),
      ),
      body: ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: model?.data.length,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    GlobalKey key = GlobalKey();
    return Slidable(
      key: key,
      child: _slidbaleItemBuilder(key, context, index),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3,
        children: <Widget>[
          SlidableAction(
            onPressed: (BuildContext context) {
              Fluttertoast.showToast(
                gravity: ToastGravity.CENTER,
                msg: '移至黑名单成功',
              );
              model?.data.removeAt(index);
              setState(() {});
            },
            icon: Icons.delete_forever,
            label: '移至黑名单',
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }

  Widget _slidbaleItemBuilder(GlobalKey key, BuildContext context, int index) {
    return FocusView(
      key: key,
      item: model?.data[index] ?? MeItem('1', 'name', 'url', 0),
    );
  }
}
