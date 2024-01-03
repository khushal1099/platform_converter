import 'package:flutter/material.dart';
import 'package:platform_converter/controller/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SettingProvider>(
        builder: (context, settingprovider, child) {
          return settingprovider.isSetting == false
              ? Container(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).width * 1,
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          maxRadius: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text("Update Profile Data")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Switch(
                          value: settingprovider.isSetting,
                          onChanged: (value) {
                            settingprovider.changesetting();
                          },
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  width: MediaQuery.sizeOf(context).width * 1,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              maxRadius: 35,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                Text("Update Profile Data")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120, top: 17),
                            child: Switch(
                              value: settingprovider.isSetting,
                              onChanged: (value) {
                                settingprovider.changesetting();
                              },
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      CircleAvatar(
                        maxRadius: 65,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 150, right: 130),
                        child: TextFormField(
                          controller: settingprovider.nameController,
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 160, right: 140),
                        child: TextFormField(
                          controller: settingprovider.bioController,
                          decoration: InputDecoration(
                            hintText: "Enter your Bio",
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Save"),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Clear"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
