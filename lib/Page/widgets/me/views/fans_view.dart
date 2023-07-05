import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/model/me/me_model.dart';
import 'package:flutter_application_1/Page/widgets/me/views/info_view.dart';

class FansView extends StatelessWidget {
  const FansView({Key? key, required this.item}) : super(key: key);
  final MeItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoView(item: item),
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
