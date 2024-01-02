import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/modal/contact_modal.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModal> contactlist = [];
  XFile? xFile;
  ImagePicker picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController chatController = TextEditingController();

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
    xFile = null;
  }

  void editContact(int index,ContactModal contact)
  {
    contactlist[index]=contact;
    notifyListeners();
  }
}
