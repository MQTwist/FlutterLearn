import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/page/model/ui_layout/cake_model.dart';

class Cake extends StatefulWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CakeState();
  }
}

class CakeState extends State<Cake> {
  CakeList? cakeList;
  @override
  void initState() {
    rootBundle.loadString('resources/cake.json').then((value) {
      var data = jsonDecode(value);
      debugPrint(data.toString());
      cakeList = CakeList.fromJson(data);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('蛋糕'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: leftColumn(index),
                flex: 2,
              ),
              Expanded(
                child: Image.asset(
                  'images/cake.png',
                  fit: BoxFit.fill,
                ),
                flex: 3,
              ),
            ],
          );
        },
        itemCount: cakeList?.data.length,
      ),
    );
  }

  ///草莓蛋糕简介：草莓它是一款受欢迎程度极高的水果，长得形状又萌又可爱，颜色还总是娇艳欲滴。用草莓做各种蛋糕，草莓也总能与它们完美融合，真是美貌与口感俱佳，草莓与蛋糕相结合的可口食物。
  Widget leftColumn(int index) {
    CakeModel? model = cakeList?.data[index];
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.green.shade100,
          ),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            _content(Text(
              model?.name ?? 'Name',
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            )),
            _content(Text(
              model?.des ?? 'des',
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            )),
            _content(_starRow(model?.reviews ?? 0)),
            _content(_buttonsRow()),
          ],
        ),
      ),
    );
  }

  Widget _starRow(int reviews) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        _stars(size: 8),
        Text(
          '$reviews ReViews',
          style: const TextStyle(fontSize: 8),
        ),
      ],
    );
  }

  Widget _stars({double size = 5}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.star, size: size),
        Icon(Icons.star, size: size),
        Icon(Icons.star, size: size),
        Icon(Icons.star, size: size),
        Icon(Icons.star, size: size),
      ],
    );
  }

  Widget _buttonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _button(Icons.kitchen, 'PREP:', '25 min'),
        _button(Icons.timer, 'COOK:', '1 hr'),
        _button(Icons.restaurant, 'FEEDS:', '4-6'),
      ],
    );
  }

  Widget _button(IconData icon, String title, String detail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Icon(icon, color: Colors.green[500], size: 12),
        Text(title, style: const TextStyle(fontSize: 8)),
        //间距
        const SizedBox(height: 5),
        Text(detail, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _content(Widget child) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        color: const Color(0xFFeae1f8),
      ),
      child: child,
    );
  }
}
