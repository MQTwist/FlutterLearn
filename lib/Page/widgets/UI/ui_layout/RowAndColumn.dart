import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  const RowAndColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row'),
      ),
      body: Center(
        child: Container(
          child: _column(),
        ),
      ),
    );
  }

  Column _column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(" see you again "),
            Text(" I am Twist "),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(" see you again "),
            Text(" I am Twist "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: const <Widget>[
            Text(" see you again "),
            Text(" I am Twist "),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: const <Widget>[
            Text(
              " see you again ",
              style: TextStyle(fontSize: 30.0),
            ),
            Text(" I am Twist "),
          ],
        ),
      ],
    );
  }
}
