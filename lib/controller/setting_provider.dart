import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/main.dart';

class SettingProvider extends ChangeNotifier {
  bool isSetting = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  XFile? settingxFile;
  ImagePicker picker = ImagePicker();

  String settingbio = prefs.getString('bio') ?? 'Update Your Profile';
  String settingname = prefs.getString('name') ?? 'Profile';

  void changesetting() {
    isSetting = !isSetting;
    notifyListeners();
  }

  void setsettingdata() {
    prefs.setString('name', settingname);
    prefs.setString('bio', settingbio);
    prefs.setString('namecontrolle', nameController.text);
    prefs.setString('biocontroller', bioController.text);
    notifyListeners();
  }

  void getsettingdata() {
    prefs.getString('name');
    prefs.getString('bio');
    prefs.getString('namecontroller');
    prefs.getString('biocontroller');
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
    settingname = '';
    settingbio= '';
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

