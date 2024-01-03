import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/platform_provider.dart';
import 'package:platform_converter/view/android/home_page.dart';
import 'package:platform_converter/view/ios/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/contact_provider.dart';


Future<void> main() async {
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
        var android = Provider.of<PlatformProvider>(context,listen: false).isAndroid;
        if (android == false) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Homepage(),
            // initialRoute: '/',
            // routes: {
            //   '/':(context) => Homepage(),
            //   'addcontactpage':(context) => AddPerson(index: ),
            //   'chatpage':(context) => ChatPage(),
            //   'callpage':(context) => CallPage(),
            //   'settings':(context) => SettingPage()
            // },
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
