import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/modal/setting_modal.dart';

class SettingProvider extends ChangeNotifier {

  List<SettingModal> settinglist = [];
  bool isSetting = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  XFile? settingxFile;

  void changesetting() {
    isSetting = !isSetting;
    notifyListeners();
  }
}
