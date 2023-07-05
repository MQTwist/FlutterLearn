import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

/// ---
/// Description:
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// Date: 2022-08-04 11:38:25
/// LastEditTime: 2022-08-04 12:00:48
/// FilePath: /flutter_application_1/lib/Page/widgets/UILayout/swiper_page.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---

class SwiperPage extends StatefulWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiper'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Swiper(
      itemBuilder: (context, index) {
        return KeepAlive(keepAlive: true, child: Page(index: index));
      },
      itemCount: 3,
      autoplay: true,
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  void dispose() {
    debugPrint('>>>dispose' + widget.index.toString());
    super.dispose();
  }

  @override
  void initState() {
    debugPrint('>>>initState' + widget.index.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    debugPrint('>>>build' + widget.index.toString());
    Color? color;
    switch (widget.index) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.yellow;
        break;
      default:
    }
    return Container(
      color: color,
      child: Center(
        child: Text(widget.index.toString()),
      ),
    );
  }

  // @override
  // bool get wantKeepAlive => true;
}
