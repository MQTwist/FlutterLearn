import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/model/me/me_model.dart';
import 'package:flutter_application_1/page/widgets/me/views/info_view.dart';

class BlackView extends StatefulWidget {
  const BlackView({Key? key, required this.item}) : super(key: key);
  final MeItem item;
  @override
  State<BlackView> createState() => _BlackViewState();
}

class _BlackViewState extends State<BlackView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoView(item: widget.item),
        _lineView(),
      ],
    );
  }

  Widget _lineView() {
    return Container(
      margin: const EdgeInsets.only(left: 73, bottom: 0),
      child: const Divider(
        height: 0.5,
        color: Color(0xFFF5F5F7),
      ),
    );
  }
}
