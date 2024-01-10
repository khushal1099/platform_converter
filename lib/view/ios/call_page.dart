import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPage_IOS extends StatefulWidget {
  const CallPage_IOS({super.key});

  @override
  State<CallPage_IOS> createState() => _CallPage_IOSState();
}

class _CallPage_IOSState extends State<CallPage_IOS> {
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
                      title: Text(contactModal.name ?? ""),
                      subtitle: Text(contactModal.number ?? ""),
                      leading: CircleAvatar(
                        radius: 30,
                        foregroundImage:
                            FileImage(File(contactModal.xFile?.path ?? "")),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            var uri = Uri.parse(
                                "tel:+91${contactModal.number ?? ""}");
                            launchUrl(uri);
                          },
                          child: Icon(CupertinoIcons.phone_fill),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Center(
                heightFactor: 35,
                child: Text("No any calls yet..."),
              );
      },
    );
  }
}
