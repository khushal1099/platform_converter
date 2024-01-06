import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingProvider extends ChangeNotifier {
  bool isSetting = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  XFile? settingxFile;
  ImagePicker picker = ImagePicker();

  String? settingbio;
  String? settingname;

  void changesetting() {
    isSetting = !isSetting;
    notifyListeners();
  }

  void pickImage() {
    picker.pickImage(source: ImageSource.camera).then(
            (value) {
          settingxFile = value;
          notifyListeners();
        }
    );
  }

  void clear(){
    settingxFile = null;
    settingname = null;
    settingbio= null;
    notifyListeners();
  }

  void textformfieldclear(){
    settingxFile = null;
    nameController.clear();
    bioController.clear();
    notifyListeners();
  }

  void refresh() {
     notifyListeners();
  }
}

