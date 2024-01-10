import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/contact_provider.dart';
import 'package:platform_converter/controller/platform_provider.dart';
import 'package:platform_converter/view/android/add_person_page.dart';
import 'package:platform_converter/view/android/call_page.dart';
import 'package:platform_converter/view/android/chat_page.dart';
import 'package:platform_converter/view/android/setting_page.dart';
import 'package:platform_converter/view/ios/home_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformProvider>(
      builder: (context, platformprovider, child) {
        return platformprovider.isAndroid
            ? Homepage1()
            : Scaffold(
                appBar: AppBar(
                  title: Text("Platform Converter"),
                  actions: [
                    Switch(
                      value: platformprovider.isAndroid,
                      onChanged: (bool value) {
                        platformprovider.changeplatform();
                      },
                    ),
                  ],
                ),
                body: Consumer<ContactProvider>(
                    builder: (context, contactprovider, child) {
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        width: MediaQuery.sizeOf(context).width * 1,
                        color: Colors.grey,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: ()  {
                                contactprovider.refresh();
                                contactprovider.index = 0;
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("HOME"),
                                    ),
                                    if (contactprovider.index == 0)
                                      Divider(
                                        thickness: 4,
                                        height: 1,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                contactprovider.refresh();
                                contactprovider.index = 1;
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("CHATS"),
                                    ),
                                    if (contactprovider.index == 1)
                                      Divider(
                                        thickness: 4,
                                        height: 1,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                contactprovider.refresh();
                                contactprovider.index = 2;
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("CALLS"),
                                    ),
                                    if (contactprovider.index == 2)
                                      Divider(
                                        thickness: 4,
                                        height: 1,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                contactprovider.refresh();
                                contactprovider.index = 3;
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("SETTINGS"),
                                    ),
                                    if (contactprovider.index == 3)
                                      Divider(
                                        thickness: 4,
                                        height: 1,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: IndexedStack(
                          index: contactprovider.index,
                          children: [
                            AddPerson(),
                            ChatPage(),
                            CallPage(),
                            SettingPage(),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              );
      },
    );
  }
}
