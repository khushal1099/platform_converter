import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/platform_provider.dart';
import 'package:platform_converter/view/android/call_page.dart';
import 'package:platform_converter/view/android/chat_page.dart';
import 'package:platform_converter/view/android/home_page.dart';
import 'package:platform_converter/view/android/setting_page.dart';
import 'package:platform_converter/view/ios/home_page.dart';
import 'package:provider/provider.dart';
import 'controller/contact_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlatformProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
      ],
      builder: (context, child) {
        var isAndroid = Provider.of<PlatformProvider>(context,listen: false).isAndroid == false;
        if (isAndroid) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/':(context) => Homepage(),
              'chatpage':(context) => ChatPage(),
              'callpage':(context) => CallPage(),
              'settings':(context) => SettingPage()
            },
          );
        } else {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/':(p0) => Homepage1(),
            },
          );
        }
      },
    );
  }
}
