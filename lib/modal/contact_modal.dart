import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactModal {
  String? name;
  String? number;
  String? chat;
  DateTime? selectdate;
  TimeOfDay? selecttime;
  XFile? xFile;

  ContactModal({
    this.name,
    this.number,
    this.xFile,
    this.chat,
    this.selectdate,
    this.selecttime,
  });
}
