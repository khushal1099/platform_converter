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
          itemCount: contactprovider.chatlist.length,
          itemBuilder: (context, index) {
            var contactModal = contactprovider.chatlist[index];
            return InkWell(
              onTap: () {
                var cp = Provider.of<ContactProvider>(context, listen: false);

                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: MediaQuery.sizeOf(context).width * 1,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    contactprovider.chatlist.removeAt(index);
                                    contactprovider.refresh();
                                  },
                                  child: Icon(Icons.delete),
                                ),
                                InkWell(
                                  onTap: () {
                                    ContactModal cm = ContactModal(
                                        name: cp.nameController.text,
                                        number: cp.phoneController.text,
                                        chat: cp.chatController.text,
                                        selectdate: cp.selectdate,
                                        selecttime: cp.selecttime,
                                        xFile: cp.xFile);

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
                          ),
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
                  child: contactModal.xFile == null ? Icon(Icons.person) : null,
                ),
                title: Text(contactModal.name ?? ""),
                subtitle: Text(contactModal.chat ?? ""),
                trailing: Text( contactModal.selectdate != null && contactModal.selecttime != null ?
                    "${contactModal.selectdate?.day}-${contactModal.selectdate?.month}-${contactModal.selectdate?.year}/${contactModal.selecttime?.hour}:${contactModal.selecttime?.minute}" : " ")
              ),
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
