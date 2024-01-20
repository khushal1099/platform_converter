import 'package:flutter/cupertino.dart';
import 'package:platform_converter/controller/platform_provider.dart';
import 'package:platform_converter/view/ios/add_person_page.dart';
import 'package:platform_converter/view/ios/call_page.dart';
import 'package:platform_converter/view/ios/chat_page.dart';
import 'package:platform_converter/view/ios/settings_page.dart';
import 'package:provider/provider.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformProvider>(
      builder: (context, platformprovider, child) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_add),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
              ),
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text(
                      "Platform Converter",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: CupertinoSwitch(
                      value: platformprovider.isAndroid,
                      onChanged: (bool value) {
                        print(value);
                        platformprovider.changeplatform();
                      },
                    ),
                  ),
                  child: IndexedStack(
                    index: index,
                    children: [
                      AddPerson_IOS(),
                      ChatPage_IOS(),
                      CallPage_IOS(),
                      SettingsPage_IOS(),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
