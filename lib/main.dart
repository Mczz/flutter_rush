import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rush/widgets/bottom_navigation.dart';

import 'network/http_utils.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  HttpUtils.init();
  registerPush();
  runApp(MyApp());
}

void registerPush(){
  JPush jpush = new JPush();
  jpush.setup(
    appKey: "827a14727324faf63124a96a",
    channel: "theChannel",
    production: false,
    debug: true, // 设置是否打印 debug 日志
  );

  jpush.addEventHandler(
    // 接收通知回调方法。
    onReceiveNotification: (Map<String, dynamic> message) async {
      print("flutter onReceiveNotification: $message");
    },
    // 点击通知回调方法。
    onOpenNotification: (Map<String, dynamic> message) async {
      print("flutter onOpenNotification: $message");
    },
    // 接收自定义消息回调方法。
    onReceiveMessage: (Map<String, dynamic> message) async {
      print("flutter onReceiveMessage: $message");
    },
  );
  jpush.getRegistrationID().then((rid) {
    print("id    $rid  ");
  });
}
class MyApp extends StatelessWidget {
  MaterialColor _white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'RushB',
      home: BottomNavigationWidget(),
      theme: ThemeData(
        primarySwatch: _white,
      ),
    );
  }
}
