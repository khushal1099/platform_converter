import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformProvider  extends ChangeNotifier {
   bool isAndroid = false;

  void changeplatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }


}