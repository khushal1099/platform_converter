import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:platform_converter/view/android/add_person_page.dart';
import 'package:provider/provider.dart';
import '../../modal/contact_modal.dart';

class ChatPage extends StatefulWidget {
  ContactModal? contact;

  ChatPage({super.key, this.contact});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ContactModal? arguments =
        ModalRoute.of(context)?.settings.arguments as ContactModal?;
    widget.contact = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<ContactProvider>(builder: (context, contactprovider, child) {
        return ListView.separated(
          itemCount: contactprovider.contactlist.length,
          itemBuilder: (context, index) {
            var contactModal = contactprovider.contactlist[index];
            return InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              backgroundImage: contactModal.xFile != null
                                  ? FileImage(
                                      File(contactModal.xFile!.path),
                                    )
                                  : null,
                              child: contactModal.xFile == null
                                  ? Icon(
                                      Icons.person,
                                      size: 40,
                                    )
                                  : null,
                              maxRadius: 60,
                            ),
                          ),
                          Text(
                            "${contactModal.name}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "${contactModal.chat}",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.010,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  contactprovider.contactlist.removeAt(index);
                                  Navigator.pop(context);
                                  contactprovider.refresh();
                                },
                                child: Icon(Icons.delete),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.010,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddPerson(
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: InkWell(
                              onTap: () {
                                 Navigator.pop(context);
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
                                  child: Text("Cancel"),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: contactModal.xFile != null
                        ? FileImage(
                            File(contactModal.xFile?.path ?? ""),
                          )
                        : null,
                    child:
                        contactModal.xFile == null ? Icon(Icons.person) : null,
                  ),
                  title: Text(contactModal.name ?? ""),
                  subtitle: Text(contactModal.chat ?? ""),
                  trailing: Text(contactModal.selectdate != null &&
                          contactModal.selecttime != null
                      ? "${contactModal.selectdate?.day}-${contactModal.selectdate?.month}-${contactModal.selectdate?.year}/${contactModal.selecttime?.hour}:${contactModal.selecttime?.minute}"
                      : " ")),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      }),
    );
  }
}
