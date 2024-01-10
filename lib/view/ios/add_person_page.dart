import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:platform_converter/modal/contact_modal.dart';
import 'package:provider/provider.dart';

class AddPerson_IOS extends StatefulWidget {
  final int? index;

  const AddPerson_IOS({super.key, this.index});

  @override
  State<AddPerson_IOS> createState() => _AddPerson_IOSState();
}

class _AddPerson_IOSState extends State<AddPerson_IOS> {
  void initState() {
    if (widget.index != null) {
      var cp = Provider.of<ContactProvider>(context, listen: false);
      var contactmodel = cp.contactlist[widget.index!];
      cp.nameController.text = contactmodel.name ?? "";
      cp.phoneController.text = contactmodel.number ?? "";
      cp.chatController.text = contactmodel.chat ?? "";
      cp.xFile = contactmodel.xFile;
      cp.selecttime = contactmodel.selecttime;
      cp.selectdate = contactmodel.selectdate;
    }
    super.initState();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contactprovider, child) {
        return CupertinoPageScaffold(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: CupertinoColors.inactiveGray,
                          blurRadius: 20,
                          spreadRadius: 1),
                    ],
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              contactprovider.imagecamera();
                            },
                            child: CircleAvatar(
                              minRadius: 80,
                              backgroundImage: contactprovider.xFile != null
                                  ? FileImage(
                                      File(contactprovider.xFile?.path ?? ""),
                                    )
                                  : null,
                              child: contactprovider.xFile == null
                                  ? Icon(CupertinoIcons.camera)
                                  : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, top: 20),
                          child: CupertinoTextFormFieldRow(

                            controller: contactprovider.nameController,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: CupertinoColors.inactiveGray),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Your Name";
                              } else {
                                return null;
                              }
                            },
                            placeholder: "Full Name",
                            prefix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(CupertinoIcons.person),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, top: 20),
                          child: CupertinoTextFormFieldRow(
                              controller: contactprovider.phoneController,
                              keyboardType: TextInputType.number,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: CupertinoColors.inactiveGray),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Your Phone Number";
                                } else if (value?.length != 10) {
                                  return "Enter Valid Number";
                                } else {
                                  return null;
                                }
                              },
                              placeholder: "Phone Number",
                              prefix: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.phone),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, top: 20),
                          child: CupertinoTextFormFieldRow(
                            controller: contactprovider.chatController,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: CupertinoColors.inactiveGray),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Chat";
                              } else {
                                return null;
                              }
                            },
                            placeholder: "Chat Conversion",
                            prefix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(CupertinoIcons.chat_bubble),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22, top: 20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => Container(
                                      color: Colors.white,
                                      height: 300,
                                      child: CupertinoDatePicker(
                                        onDateTimeChanged: (value) {
                                          contactprovider.selectdate = value;
                                          contactprovider.refresh();
                                          print(
                                              "${contactprovider.selectdate!.day}-${contactprovider.selectdate!.month}-${contactprovider.selectdate!.year}");
                                        },
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(CupertinoIcons.calendar),
                                    ),
                                    Text(
                                      contactprovider.selectdate != null
                                          ? contactprovider.mydate.format(
                                              contactprovider.selectdate!)
                                          : "PickDate",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: CupertinoColors.inactiveGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 22, top: 15, bottom: 20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => Container(
                                      color: Colors.white,
                                      height: 300,
                                      child: CupertinoDatePicker(
                                        onDateTimeChanged: (value) {
                                          contactprovider.selecttime =
                                              TimeOfDay.fromDateTime(value);
                                          contactprovider.refresh();
                                        },
                                        mode: CupertinoDatePickerMode.time,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(CupertinoIcons.time),
                                    ),
                                    Text(
                                      contactprovider.selecttime != null
                                          ? "${contactprovider.selecttime?.hour}:${contactprovider.selecttime?.minute}"
                                          : "PickTime",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: CupertinoColors.inactiveGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CupertinoButton.filled(
                            child: Text("Save"),
                            onPressed: () {
                              var cp = Provider.of<ContactProvider>(context,
                                  listen: false);

                              ContactModal cm = ContactModal(
                                  name: cp.nameController.text,
                                  number: cp.phoneController.text,
                                  chat: cp.chatController.text,
                                  selectdate: cp.selectdate,
                                  selecttime: cp.selecttime,
                                  xFile: cp.xFile);

                              if (formkey.currentState?.validate() ?? false) {
                                FocusScope.of(context)
                                    .unfocus(); // For keyboard Close
                                if (cp.selectdate == null) {
                                  DateValidator(context);
                                } else if (cp.selecttime == null) {
                                  TimeValidator(context);
                                } else {
                                  if (widget.index != null) {
                                    contactprovider.editContact(
                                        widget.index ?? 0, cm);
                                    contactprovider.reset();
                                  } else {
                                    contactprovider.addcontact(cm);
                                    SaveConfirmDialog(context);
                                    contactprovider.reset();
                                  }
                                }
                              }
                              Provider.of<ContactProvider>(context,
                                      listen: false)
                                  .refresh();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void DateValidator(context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('PickDate'),
          content: Text("Date was not selected !!"),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void TimeValidator(context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("PickTime"),
          content: Text("Time was not selected !!"),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void SaveConfirmDialog(context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Save"),
          content: Text("Contact has been successfully saved."),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
