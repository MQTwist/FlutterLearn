import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/text_icon_button.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// Date: 2022-11-17 16:58:46
/// LastEditTime: 2022-11-17 17:20:45
/// FilePath: /flutter_application_1/lib/Page/widgets/UILayout/text_icon_button_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class TextIconButtonPage extends StatefulWidget {
  const TextIconButtonPage({Key? key}) : super(key: key);

  @override
  State<TextIconButtonPage> createState() => _TextIconButtonPageState();
}

class _TextIconButtonPageState extends State<TextIconButtonPage> {
  TextIconButtonType type = TextIconButtonType.imageLeft;
  double margin = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextIconButton"),
      ),
      body: _body(),
    );
  }

  _body() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          TextIconButton(
            icon: const Icon(Icons.flutter_dash),
            text: const Text('文字'),
            type: type,
            margin: margin,
          ),
          const SizedBox(height: 100),
          _textButton('图片在左', 0),
          _textButton('图片在右', 1),
          _textButton('图片在上', 2),
          _textButton('图片在下', 3),
          _textButton('加间距: ' + margin.toString(), 4),
          _textButton('减间距: ' + margin.toString(), 5),
        ],
      ),
    );
  }

  _textButton(String title, int index) {
    return Container(
      color: type.index == index ? Colors.red : null,
      child: TextButton(
          onPressed: () {
            switch (index) {
              case 0:
                type = TextIconButtonType.imageLeft;
                break;
              case 1:
                type = TextIconButtonType.imageRight;
                break;
              case 2:
                type = TextIconButtonType.imageTop;
                break;
              case 3:
                type = TextIconButtonType.imageBottom;
                break;
              case 4:
                margin += 2;
                margin = min(margin, 50);
                break;
              case 5:
                margin -= 2;
                margin = max(margin, 0);
                break;
              default:
            }
            setState(() {});
          },
          child: Text(title)),
    );
  }
}
