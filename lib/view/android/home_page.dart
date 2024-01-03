import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/platform_provider.dart';
import 'package:platform_converter/view/android/add_person_page.dart';
import 'package:platform_converter/view/android/call_page.dart';
import 'package:platform_converter/view/android/chat_page.dart';
import 'package:platform_converter/view/android/setting_page.dart';
import 'package:platform_converter/view/ios/home_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformProvider>(
      builder: (context, platformprovider, child) {
        return platformprovider.isAndroid
            ? Homepage1()
            : DefaultTabController(
          length: 4,
          child: Scaffold(
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
              bottom: TabBar(
                physics: BouncingScrollPhysics(),
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Icon(Icons.person_add_alt),
                  Text("CHATS"),
                  Text("CALLS"),
                  Text("SETTINGS"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AddPerson(),
                ChatPage(),
                CallPage(),
                SettingPage()
              ],
            ),
          ),
        );
      },
    );
  }
}
