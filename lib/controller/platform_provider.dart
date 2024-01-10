import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/main.dart';

class PlatformProvider  extends ChangeNotifier {
   bool isAndroid = prefs.getBool('platform') ?? false;

  void changeplatform() {
    isAndroid = !isAndroid;
    prefs.setBool('platform', isAndroid);
    notifyListeners();
  }

  void getplatform() {
    bool? val = prefs.getBool('platform');
    print(val);
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}