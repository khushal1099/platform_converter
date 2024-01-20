import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/platform_provider.dart';
import 'package:platform_converter/controller/setting_provider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
import 'package:platform_converter/view/android/home_page.dart';
import 'package:platform_converter/view/android/splash_screen.dart';
import 'package:platform_converter/view/ios/home_page.dart';
import 'package:platform_converter/view/ios/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/contact_provider.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
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
        ChangeNotifierProvider(
          create: (context) => SettingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..getTheme(),
        ),
      ],
      builder: (context, child) {

        return Consumer2<PlatformProvider,ThemeProvider>(
          builder: (context, platformProvider,themeprovider, child) {
            if (platformProvider.isAndroid == false) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: themeprovider.thememode,
              );
            } else {
              return Consumer<ThemeProvider>(
                  builder: (context, themeprovider, child) {
                return CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen_IOS(),
                  theme: CupertinoThemeData(
                      brightness: themeprovider.currentTheme
                          ? Brightness.dark
                          : Brightness.light),
                );
              });
            }
          },
        );
      },
    );
  }
}
