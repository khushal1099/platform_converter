import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactModal {
  String? name;
  String? number;
  String? chat;
  DateTime? selectdate;
  TimeOfDay? selecttime;
  XFile? xFile;

  ContactModal({this.name, this.number, this.xFile, this.chat, this.selectdate, this.selecttime});

  factory ContactModal.fromJson(Map<String, dynamic> json) => ContactModal(
    name: json["name"],
    number: json["number"],
    chat: json["chat"],
    selectdate: json["selectdate"],
    selecttime: json["selecttime"],
    xFile: json["xFile"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "chat": chat,
    "selectdate": selectdate,
    "selecttime": selecttime,
    "xFile": xFile,
  };
}