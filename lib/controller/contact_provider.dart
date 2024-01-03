import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:platform_converter/modal/contact_modal.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModal> contactlist = [];
  XFile? xFile;
  ImagePicker picker = ImagePicker();
  final mydate = DateFormat.yMd();
  final mydatetime = DateFormat.yMMMEd();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController chatController = TextEditingController();

  DateTime? selectdate;
  TimeOfDay? selecttime;


  void addcontact(ContactModal contact) {
    contactlist.add(contact);
    notifyListeners();
  }

  void imagecamera() {
    picker.pickImage(source: ImageSource.camera).then(
      (value) {
        xFile = value;
        notifyListeners();
      },
    );
  }

  void reset() {
    nameController.clear();
    phoneController.clear();
    chatController.clear();
    selectdate = null;
    selecttime = null;
    xFile = null;
    notifyListeners();
  }

  void editContact(int index, ContactModal contact) {
    contactlist[index] = contact;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  void deleteContact(int index) {
    contactlist.removeAt(index);
    notifyListeners();
  }

}