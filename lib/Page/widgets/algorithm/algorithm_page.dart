import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/widgets/algorithm/middle/middle_page.dart';
import 'package:flutter_application_1/page/widgets/algorithm/primary/primary_page.dart';
import 'package:flutter_application_1/page/widgets/algorithm/senior/senior_page.dart';

class AlgorithmPage extends StatefulWidget {
  const AlgorithmPage({super.key});

  @override
  State<AlgorithmPage> createState() => _AlgorithmPageState();
}

class _AlgorithmPageState extends State<AlgorithmPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("算法"),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.stay_primary_landscape), text: '初级'),
              Tab(icon: Icon(Icons.mobile_friendly), text: '中级'),
              Tab(icon: Icon(Icons.sensor_window_rounded), text: '高级'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PrimaryPage(),
            MiddlePage(),
            SeniorPage(),
          ],
        ),
      ),
    );
  }
}
