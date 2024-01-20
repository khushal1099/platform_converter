import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:platform_converter/view/ios/home_page.dart';

class SplashScreen_IOS extends StatefulWidget {
  const SplashScreen_IOS({super.key});

  @override
  State<SplashScreen_IOS> createState() => _SplashScreen_IOSState();
}

class _SplashScreen_IOSState extends State<SplashScreen_IOS> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                Homepage1(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: MediaQuery.sizeOf(context).height * 0.2,
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset("images/ci_ios.webp"),
        ),
      ),
    );
  }
}
