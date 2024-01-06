import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contactprovider, child) {
        return Scaffold(
          body: ListView.separated(
            itemCount: contactprovider.contactlist.length,
            itemBuilder: (context, index) {
              var contactModal = contactprovider.contactlist[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: contactModal.xFile != null
                      ? FileImage(
                          File(contactModal.xFile?.path ?? ""),
                        )
                      : null,
                  child: contactModal.xFile == null ? Icon(Icons.person) : null,
                ),
                title: Text(contactModal.name ?? ""),
                subtitle: Text(contactModal.number ?? ""),
                trailing: IconButton(
                  onPressed: () {
                    var uri = Uri.parse("tel:+91${contactModal.number ?? ""}");
                    launchUrl(uri);
                  },
                  icon: Icon(Icons.phone),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          ),
        );
      },
    );
  }
}
