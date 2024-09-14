// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// /// ---
// /// Description: 网络状态判断
// /// Author: MQTwist
// /// Github: https://github.com/MQTwist
// /// Blog: https://www.jianshu.com/u/47a35e62c1bf
// /// Date: 2023-07-05 19:17:25
// /// LastEditors: MQTwist
// /// LastEditTime: 2023-07-06 09:40:10
// /// FilePath: /flutter/lib/tool/net_reachability.dart
// /// Copyright © 2023 by MQTwist, All Rights Reserved.
// /// ---

// class NetReachability {
//   static NetReachability? _instance;

//   factory NetReachability() => _getInstance();

//   static NetReachability get instance => _getInstance();

//   static NetReachability _getInstance() {
//     _instance ??= NetReachability._internal();
//     return _instance!;
//   }

//   NetReachability._internal();

//   /// 判断网络状态
//   Future<NetReachabilityResult> checkNetwork() async {
//     ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
//     late NetReachabilityResult result;
//     switch (connectivityResult) {
//       case ConnectivityResult.bluetooth:
//         result = NetReachabilityResult.bluetooth;
//         break;
//       case ConnectivityResult.wifi:
//         result = NetReachabilityResult.wifi;
//         break;
//       case ConnectivityResult.ethernet:
//         result = NetReachabilityResult.ethernet;
//         break;
//       case ConnectivityResult.mobile:
//         result = NetReachabilityResult.mobile;
//         break;
//       case ConnectivityResult.none:
//         result = NetReachabilityResult.none;
//         break;
//       case ConnectivityResult.vpn:
//         result = NetReachabilityResult.vpn;
//         break;
//       case ConnectivityResult.other:
//         result = NetReachabilityResult.other;
//         break;
//       default:
//     }
//     debugPrint(">>> checkNetwork = $result");
//     return result;
//   }

//   /// 定义一个Controller
//   final StreamController<NetReachabilityResult> _yjStreamController =
//       StreamController<NetReachabilityResult>();

//   ///获取 StreamSink 做 add 入口
//   StreamSink<NetReachabilityResult> get _yjSink => _yjStreamController.sink;

//   /// 流
//   Stream<ConnectivityResult>? _stream;

//   /// 监听网络状态
//   /// 使用完记得close
//   Stream<NetReachabilityResult> get onConnectivityChanged {
//     _stream = Connectivity().onConnectivityChanged;

//     _stream!.listen((event) {
//       switch (event) {
//         case ConnectivityResult.bluetooth:
//           _yjSink.add(NetReachabilityResult.bluetooth);
//           break;
//         case ConnectivityResult.wifi:
//           _yjSink.add(NetReachabilityResult.wifi);
//           break;
//         case ConnectivityResult.ethernet:
//           _yjSink.add(NetReachabilityResult.ethernet);
//           break;
//         case ConnectivityResult.mobile:
//           _yjSink.add(NetReachabilityResult.mobile);
//           break;
//         case ConnectivityResult.none:
//           _yjSink.add(NetReachabilityResult.none);
//           break;
//         case ConnectivityResult.vpn:
//           _yjSink.add(NetReachabilityResult.vpn);
//           break;
//         case ConnectivityResult.other:
//           _yjSink.add(NetReachabilityResult.other);
//           break;
//         default:
//       }
//     });
//     return _yjStreamController.stream;
//   }

//   /// 移除
//   close() {
//     _yjStreamController.close();
//     _stream = null;
//   }
// }

// enum NetReachabilityResult {
//   /// Bluetooth: Device connected via bluetooth
//   bluetooth,

//   /// WiFi: Device connected via Wi-Fi
//   wifi,

//   /// Ethernet: Device connected to ethernet network
//   ethernet,

//   /// Mobile: Device connected to cellular network
//   mobile,

//   /// None: Device not connected to any network
//   none,

//   /// VPN: Device connected to a VPN
//   ///
//   /// Note for iOS and macOS:
//   /// There is no separate network interface type for [vpn].
//   /// It returns [other] on any device (also simulator).
//   vpn,

//   /// Other: Device is connected to an unknown network
//   other
// }
