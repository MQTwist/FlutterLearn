import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AgentSalePage extends StatefulWidget {
  const AgentSalePage({super.key});

  @override
  State<AgentSalePage> createState() => _AgentSalePageState();
}

class _AgentSalePageState extends State<AgentSalePage> {
  int calcValue = 0;

  @override
  void initState() {
    super.initState();
    SalesAgent temp = _createAgent();
    calcValue = _calcAll(temp);
    setState(() {});
  }

  int _calcAll(SalesAgent? agent) {
    if (agent == null) {
      return 0;
    }
    return _calcAll(agent.left) + _calcAll(agent.right) + agent.directSales;
  }

  SalesAgent _createAgent() {
    SalesAgent A = SalesAgent("A", 15);

    SalesAgent B = SalesAgent("B", 6);
    SalesAgent C = SalesAgent("C", 4);
    A.left = B;
    A.right = C;

    SalesAgent D = SalesAgent("D", 8);
    SalesAgent E = SalesAgent("E", 2);
    B.left = D;
    B.right = E;

    SalesAgent F = SalesAgent("F", 1);
    SalesAgent G = SalesAgent("G", 9);
    C.left = F;
    C.right = G;
    return A;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Get.arguments)),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("问题描述"),
          const SizedBox(height: 20),
          const Text(
              "一级代理：A \n二级代理：B，C \n三级代理：D，E，F，G \n其中，B, C向A汇报；D, E向B汇报；F, G向C汇报； \n各代理的直接销售额为(单位：万)： \nA = 15, B = 6, C = 4, D = 8, E = 2, F = 1, G = 9"),
          const SizedBox(height: 50),
          Text("计算结果：$calcValue"),
        ],
      ),
    );
  }
}

class SalesAgent {
  final String name;
  final int directSales;
  SalesAgent? left;
  SalesAgent? right;

  SalesAgent(this.name, this.directSales);
}
