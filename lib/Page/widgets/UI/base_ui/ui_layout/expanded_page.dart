import 'package:flutter/material.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// Date: 2022-04-29 10:05:57
/// FilePath: /flutter_application_1/lib/Page/widgets/UILayout/expanded_page.dart
///
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded'),
      ),
      body: Column(
        children: [
          _getRow(),
          _getRow1(),
        ],
      ),
    );
  }

  _getRow() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 100,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: const Text('头像'),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              '山药当归枸杞 go山药当归枸杞 go看我抓一把中药服下一帖骄傲',
            ),
          ),
          const SizedBox(
            width: 40,
            height: 40,
            child: Icon(Icons.heart_broken_rounded),
          ),
        ],
      ),
    );
  }

  _getRow1() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.red),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.blue),
          ),
          Expanded(
            flex: 1,
            child: Container(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
