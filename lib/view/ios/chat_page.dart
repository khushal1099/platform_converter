import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:platform_converter/view/ios/add_person_page.dart';
import 'package:provider/provider.dart';

class ChatPage_IOS extends StatefulWidget {
  const ChatPage_IOS({super.key});

  @override
  State<ChatPage_IOS> createState() => _ChatPage_IOSState();
}

class _ChatPage_IOSState extends State<ChatPage_IOS> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contactprovider, child) {
        return contactprovider.contactlist.isNotEmpty
            ? CupertinoListSection(
                children: List.generate(
                  contactprovider.contactlist.length,
                  (index) {
                    var contactModal = contactprovider.contactlist[index];
                    return CupertinoListTile(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      leadingSize: 80,
                      leadingToTitle: 5,
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 350,
                            color: CupertinoColors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: contactModal.xFile != null
                                      ? FileImage(
                                          File(contactModal.xFile?.path ?? ""),
                                        )
                                      : null,
                                  child: contactModal.xFile == null
                                      ? Icon(Icons.person)
                                      : null,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  contactModal.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  contactModal.chat ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CupertinoButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(CupertinoPageRoute(
                                          builder: (context) =>
                                              AddPerson_IOS(index: index),
                                        ));
                                      },
                                      child: const Icon(CupertinoIcons.pen),
                                    ),
                                    CupertinoButton(
                                      onPressed: () {
                                        contactprovider.contactlist.removeAt(index);
                                        Navigator.pop(context);
                                        contactprovider.refresh();
                                      },
                                      child: const Icon(
                                          CupertinoIcons.delete_solid),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CupertinoButton.filled(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        foregroundImage:
                            FileImage(File(contactModal.xFile?.path ?? "")),
                      ),
                      title: Text(contactModal.name ?? ""),
                      subtitle: Text(contactModal.chat ?? ""),
                      trailing: Text( contactModal.selectdate != null && contactModal.selecttime != null ?
                      "${contactModal.selectdate?.day}-${contactModal.selectdate?.month}-${contactModal.selectdate?.year}/${contactModal.selecttime?.hour}:${contactModal.selecttime?.minute}" : "")
                    );
                  },
                ),
              )
            : Center(
                heightFactor: 35,
                child: Text("No any chat yet..."),
              );
      },
    );
  }
}
