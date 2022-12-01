import 'dart:math';

import 'package:flutter/material.dart';

//创建widget
class RandomNums extends StatefulWidget {
  const RandomNums({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RandomNumsState();
  }
}

// 添加 RandomWordsState 类, 该类持有RandomWords widget的状态。这个类将保存随着用户滚动而无限增长的生成的随机数，以及喜欢的数对，用户通过重复点击心形 ❤️ 图标来将它们从列表中添加或删除。
class RandomNumsState extends State<RandomNums> {
  // 列表数据源
  final _dataArr = <int>[];
  // 选中的集合
  final _saved = <int>{};
  // font
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    //返回一个Scaffold（widget）
    return Scaffold(
      appBar: AppBar(
        title: const Text('你喜欢的随机数'),
        actions: [
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list)),
        ],
      ),
      body: _buildDataArr(),
    );
  }

  //生成一个随机数
  int _randomNum() {
    return Random().nextInt(100);
  }

  List<int> _nextNums(int count) {
    final arr = <int>[];
    for (var i = 0; i < count; i++) {
      arr.add(_randomNum());
    }
    return arr;
  }

  //创建listView
  Widget _buildDataArr() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分割线widget
          if (i.isOdd) return const Divider();
          // “i ~/ 2”表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          //如果是列表中最后一个随机数
          if (index >= _dataArr.length) {
            //就再生成10个，添加到数据源中
            _dataArr.addAll(_nextNums(10));
          }
          //返回listView的 row要展示的内容
          return _buildRow(_dataArr[index], index);
        });
  }

  //对于每一个随机数对，_buildDataArr函数都会调用一次_buildRow
  Widget _buildRow(int num, int row) {
    //判断是否已经在收藏集合中
    final alreadySaved = _saved.contains(num);
    return ListTile(
      title: Text(
        "第$row行: " + num.toString(),
        style: _biggerFont,
      ),
      //右侧添加心形button
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      // 添加点击事件
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(num);
          } else {
            _saved.add(num);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (num) {
              return ListTile(
                title: Text(
                  num.toString(),
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided =
              ListTile.divideTiles(context: context, tiles: tiles).toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Save like nums'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }
}
