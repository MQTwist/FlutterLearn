import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  List<String> dataArr = [
    '粉丝',
    '关注',
    '黑名单',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return _row(index);
        },
        itemCount: dataArr.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0.1,
            color: Colors.blue,
          );
        },
      ),
    );
  }

  Widget _row(int index) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              dataArr[index],
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      onTap: () {
        _pushPage(index);
      },
    );
  }

  _pushPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(
          'Fans',
          arguments: {'name': dataArr[index]},
        );
        break;
      case 1:
        Navigator.of(context).pushNamed(
          'Focus',
          arguments: {'name': dataArr[index]},
        );
        break;
      case 2:
        Navigator.of(context).pushNamed(
          'BlackList',
          arguments: {'name': dataArr[index]},
        );
        break;
      default:
    }
  }
}
