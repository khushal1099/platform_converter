import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:platform_converter/modal/contact_modal.dart';
import 'package:provider/provider.dart';

class AddPerson extends StatefulWidget {
  final int? index;
  const AddPerson({super.key, this.index});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {

  @override
  void initState() {
    var cp = Provider.of<ContactProvider>(context, listen: false);

    if (widget.index != null) {
      var cp = Provider.of<ContactProvider>(context, listen: false);
      var contactmodel = cp.contactlist[widget.index!];
      cp.nameController.text = contactmodel.name ?? "";
      cp.phoneController.text = contactmodel.number ?? "";
      cp.xFile = contactmodel.xFile;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Consumer<ContactProvider>(
            builder: (context, contactprovider, child) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: 1, blurRadius: 15),
                ],
              ),
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: contactprovider.chatController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.chat),
                        hintText: "Chat Conversation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text("Pick Date"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 246),
                    child: Text("Pick Time"),
                  ),
                  InkWell(
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
                        child: InkWell(
                          onTap: () {
                            var cp = Provider.of<ContactProvider>(context,
                                listen: false);

                            ContactModal cm = ContactModal(
                                name: cp.nameController.text,
                                number: cp.phoneController.text,
                                chat: cp.chatController.text,
                                xFile: cp.xFile);

                            contactprovider.addcontact(cm);
                            contactprovider.reset();
                            print(contactprovider.contactlist);

                            // Navigator.pushNamed(context, 'chatpage');
                          },
                          child: Text("Save"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
