import 'package:flutter/material.dart';

class UIPage extends StatefulWidget {
  const UIPage({Key? key}) : super(key: key);

  @override
  State<UIPage> createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  List<Widget> widgets = [];
  List<String> dataArr = [
    '随机数',
    'UI布局',
    '蛋糕',
    'StatelessPage',
    'Swiper',
    'TextIconButton',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI"),
      ),
      body: ListView.separated(
        itemCount: dataArr.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0.5,
            color: Colors.blue,
          );
        },
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(dataArr[i]),
      ),
      onTap: () {
        setState(() {
          _pushNewPage(i);
        });
      },
    );
  }

  _pushNewPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('LikeNum');
        break;
      case 1:
        Navigator.of(context).pushNamed('UI/H');
        break;
      case 2:
        Navigator.of(context).pushNamed('Cake');
        break;
      case 3:
        Navigator.of(context).pushNamed('Stateless');
        break;
      case 4:
        Navigator.of(context).pushNamed('swiper');
        break;
      case 5:
        Navigator.of(context).pushNamed('TextIconButton');
        break;
      default:
    }
  }
}
