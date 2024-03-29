import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:platform_converter/modal/contact_modal.dart';
import 'package:provider/provider.dart';

class AddPerson extends StatefulWidget {
  final int? index;

  AddPerson({super.key, this.index});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  @override
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
    return Scaffold(
      body: Consumer<ContactProvider>(
        builder: (context, contactprovider, child) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 1, blurRadius: 15),
                    ],
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
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
                                  ? Icon(Icons.add_a_photo_outlined)
                                  : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: TextFormField(
                            controller: contactprovider.nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Full Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Your Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: TextFormField(
                            controller: contactprovider.phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Your Number";
                              } else if (value?.length != 10) {
                                return "Enter Valid Phone Number";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: TextFormField(
                            controller: contactprovider.chatController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.chat),
                              hintText: "Chat Conversation",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Chat";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 28, top: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  contactprovider.selectdate =
                                      await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2050),
                                    barrierDismissible: false,
                                  );
                                  contactprovider.refresh();
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                contactprovider.selectdate != null
                                    ? contactprovider.mydate
                                        .format(contactprovider.selectdate!)
                                    : "PickDate",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 28, top: 20, bottom: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  contactprovider.selecttime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  contactprovider.refresh();
                                },
                                child: Icon(
                                  Icons.access_time_outlined,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                contactprovider.selecttime != null
                                    ? "${contactprovider.selecttime?.hour}:${contactprovider.selecttime?.minute}"
                                    : "PickTime",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
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
                              formkey.currentState?.save();
                              if (cp.selectdate == null &&
                                  cp.selecttime == null) {
                                final snackBar = SnackBar(
                                  content: Text('Pick Date & Time Please !!'),
                                  duration: Duration(
                                      seconds:
                                          2), // You can customize the duration
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else if (widget.index != null) {
                                contactprovider.editContact(
                                    widget.index ?? 0, cm);
                                contactprovider.reset();
                              } else {
                                contactprovider.addcontact(cm);
                                final snackBar = SnackBar(
                                  content: Text('Contact Saved Successfully'),
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                contactprovider.reset();
                              }
                            }
                            Provider.of<ContactProvider>(context, listen: false)
                                .refresh();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 15),
                              ],
                            ),
                            child: Center(
                              child: Text("Save"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
