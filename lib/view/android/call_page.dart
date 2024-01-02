import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:provider/provider.dart';

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
        body: ListView.builder(
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
              subtitle: Text(contactModal.chat ?? ""),
            );
          },
        ),
      );
    });
  }
}
