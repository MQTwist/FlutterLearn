import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/model/me/me_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key, required this.item}) : super(key: key);
  final MeItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 45,
            height: 45,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(45 / 2)),
            ),
            child: CachedNetworkImage(
              imageUrl: item.url,
              placeholder: (context, url) {
                return Image.asset('images/top.jpeg');
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 13, fontFamily: 'Regular'),
            ),
          ),
          if (item.state > 0) _focusLabel(),
        ],
      ),
    );
  }

  Widget _focusLabel() {
    String stateStr = '';
    Color textColor = const Color(0xFFC5C4CC);
    // 0: 不显示 1：未关注 2：已关注 3：互相关注
    switch (item.state) {
      case 1:
        stateStr = '回关';
        textColor = Colors.blue;
        break;
      case 2:
        stateStr = '已关注';
        break;
      case 3:
        stateStr = '互相关注';
        break;
      default:
    }
    double height = 28;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        alignment: const Alignment(0, 0),
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(height / 2),
          border: item.state == 1 ? Border.all(width: 1, color: Colors.blue) : null,
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Text(
            stateStr,
            style: TextStyle(fontFamily: 'Medium', fontSize: 12, color: textColor),
          ),
        ),
      ),
      onTap: () {
        if (item.state == 1) {
          Fluttertoast.showToast(
            msg: "点击了关注",
            gravity: ToastGravity.CENTER,
          );
        }
      },
    );
  }
}
