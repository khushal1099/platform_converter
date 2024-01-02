import 'package:image_picker/image_picker.dart';

class ContactModal {
  String? name;
  String? number;
  String? chat;
  XFile? xFile;

  ContactModal({this.name, this.number, this.xFile, this.chat});
}