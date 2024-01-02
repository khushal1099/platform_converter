import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/platform_provider.dart';
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
      return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          middle: Text("Platform Converter",style: TextStyle(color: Colors.black),),
          trailing: CupertinoSwitch(
            value: platformprovider.isAndroid,
            onChanged: (value) {
              // Provider.of<PlatformProvider>(context,listen: false).changeplatform();
            },
          ),
        ),
        child: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
            ),
          ],
        ),
      );
    });
    ;
  }
}
