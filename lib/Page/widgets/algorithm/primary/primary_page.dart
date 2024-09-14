import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/base/page_data.dart';
import 'package:get/get.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({super.key});

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  List<PageDada> pageDadas = [
    PageDada("总代理销售总额", "AgentSalePage"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF0F0F5),
      child: ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: pageDadas.length,
        itemExtent: 60,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    PageDada pageDada = pageDadas[index];
    return GestureDetector(
      onTap: () {
        Get.toNamed(pageDada.route, arguments: pageDada.title);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerLeft,
        child: Text(pageDada.title),
      ),
    );
  }
}
