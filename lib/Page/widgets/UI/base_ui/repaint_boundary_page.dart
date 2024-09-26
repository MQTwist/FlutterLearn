import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/base/page_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepaintBoundaryPage extends StatefulWidget {
  const RepaintBoundaryPage({super.key});

  @override
  State<RepaintBoundaryPage> createState() => _RepaintBoundaryPageState();
}

class _RepaintBoundaryPageState extends State<RepaintBoundaryPage> {
  final GlobalKey _paintKey = GlobalKey();
  Offset _offset = Offset.zero;
  MediaQueryData mediaQuery =
      MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RepaintBoundaryPage"),
      ),
      body: Stack(
        children: <Widget>[
          _buildBackground(repaintBoundary: true),
          _buildCursor(),
        ],
      ),
    );
  }

  Widget _buildBackground({bool repaintBoundary = false}) {
    Widget child = CustomPaint(
      painter: BackgroundColor(Size(1.sw, 1.sw)),
      isComplex: false,
      willChange: false,
    );
    if (repaintBoundary) {
      child = RepaintBoundary(child: child);
    }
    return child;
  }

  Widget _buildCursor() {
    return Listener(
      onPointerDown: _updateOffset,
      onPointerMove: _updateOffset,
      child: CustomPaint(
        key: _paintKey,
        painter: CursorPointer(_offset),
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      ),
    );
  }

  _updateOffset(PointerEvent event) {
    RenderBox? referenceBox = _paintKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = referenceBox.globalToLocal(event.position);
    setState(() {
      _offset = offset;
    });
  }
}

class BackgroundColor extends CustomPainter {
  static const List<Color> colors = [
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.red,
  ];

  final Size _size;
  BackgroundColor(this._size);

  @override
  void paint(Canvas canvas, Size size) {
    final Random rand = Random();
    mqPrint(">>>paint rand:${rand.nextDouble()} size:$size");
    for (int i = 0; i < 100; i++) {
      canvas.drawOval(
          Rect.fromCenter(
            center: Offset(
              max(rand.nextDouble() * _size.width, 10),
              max(rand.nextDouble() * _size.height, 10),
            ),
            width: rand.nextDouble() * rand.nextInt(150) + 200,
            height: rand.nextDouble() * rand.nextInt(150) + 200,
          ),
          Paint()..color = colors[rand.nextInt(colors.length)].withOpacity(0.3));
    }
  }

  @override
  // bool shouldRepaint(BackgroundColor oldDelegate) => this != oldDelegate;
  bool shouldRepaint(BackgroundColor oldDelegate) => false;
}

class CursorPointer extends CustomPainter {
  final Offset _offset;

  CursorPointer(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      _offset,
      10.0,
      Paint()..color = Colors.green,
    );
  }

  @override
  bool shouldRepaint(CursorPointer oldDelegate) => oldDelegate._offset != _offset;
}
