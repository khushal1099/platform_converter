import 'package:flutter/cupertino.dart';

class PlatformProvider extends ChangeNotifier {
   bool isAndroid = false;

  void changeplatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}