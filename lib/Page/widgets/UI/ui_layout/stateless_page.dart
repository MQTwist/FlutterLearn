/*
 * @Description: 
 * @Author: MQTwist
 * @Github: https://github.com/MQTwist
 * @Blog: https://www.jianshu.com/u/47a35e62c1bf
 * @Date: 2022-04-07 18:53:34
 * @LastEditors: MQTwist
 * @LastEditTime: 2022-04-07 18:57:22
 * @FilePath: /flutter_application_1/lib/Page/widgets/UILayout/stateless_page.dart
 * 
 * Copyright © 2022 MQTwist, All Rights Reserved. 
 */

import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({
    Key? key,
    required this.content,
    required this.backgroudColor,
  }) : super(key: key);

  final String content;
  final Color backgroudColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content),
      ),
      body: Center(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          color: backgroudColor,
          child: Text(content),
        ),
      ),
    );
  }
}
