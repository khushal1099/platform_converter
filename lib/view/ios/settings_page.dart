import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/setting_provider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage_IOS extends StatefulWidget {
  const SettingsPage_IOS({super.key});

  @override
  State<SettingsPage_IOS> createState() => _SettingsPage_IOSState();
}

class _SettingsPage_IOSState extends State<SettingsPage_IOS> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, settingprovider, child) {
        return Column(
          children: [
            settingprovider.isSetting == false
                ? Container(
                    margin: EdgeInsets.only(top: 2),
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 1,
                    color: Colors.grey,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                maxRadius: 35,
                                backgroundImage:
                                    settingprovider.settingxFile != null
                                        ? FileImage(
                                            File(settingprovider
                                                    .settingxFile?.path ??
                                                ""),
                                          )
                                        : null,
                                child: settingprovider.settingxFile == null &&
                                        settingprovider.isSetting == true
                                    ? Icon(Icons.add_a_photo_outlined)
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${settingprovider.settingname}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Text("${settingprovider.settingbio}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 22,
                          right: 15,
                          child: CupertinoSwitch(
                            value: settingprovider.isSetting,
                            onChanged: (value) {
                              settingprovider.changesetting();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        width: MediaQuery.sizeOf(context).width * 1,
                        color: Colors.grey,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    maxRadius: 35,
                                    backgroundImage:
                                        settingprovider.settingxFile != null
                                            ? FileImage(
                                                File(settingprovider
                                                        .settingxFile?.path ??
                                                    ""),
                                              )
                                            : null,
                                    child: settingprovider.settingxFile ==
                                                null &&
                                            settingprovider.isSetting == true
                                        ? Icon(CupertinoIcons.camera)
                                        : null,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 17, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${settingprovider.settingname}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "${settingprovider.settingbio}",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 22,
                              right: 15,
                              child: CupertinoSwitch(
                                value: settingprovider.isSetting,
                                onChanged: (value) {
                                  settingprovider.changesetting();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        width: MediaQuery.sizeOf(context).width * 1,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          settingprovider.pickImage();
                                        },
                                        child: CircleAvatar(
                                          maxRadius: 35,
                                          backgroundImage:
                                              settingprovider.settingxFile !=
                                                      null
                                                  ? FileImage(
                                                      File(settingprovider
                                                              .settingxFile
                                                              ?.path ??
                                                          ""),
                                                    )
                                                  : null,
                                          child: settingprovider.settingxFile ==
                                                      null &&
                                                  settingprovider.isSetting ==
                                                      true
                                              ? Icon(CupertinoIcons.camera)
                                              : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 17, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${settingprovider.settingname}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "${settingprovider.settingbio}",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 22,
                                  right: 15,
                                  child: CupertinoSwitch(
                                    value: settingprovider.isSetting,
                                    onChanged: (value) {
                                      settingprovider.changesetting();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 10, right: 40),
                              child: CupertinoTextFormFieldRow(
                                controller: settingprovider.nameController,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: CupertinoColors.white),
                                ),
                                placeholder: "Full Name",
                                prefix: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(CupertinoIcons.person),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 10, right: 40),
                              child: CupertinoTextFormFieldRow(
                                controller: settingprovider.bioController,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: CupertinoColors.white),
                                ),
                                placeholder: "Enter Bio",
                                prefix: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(CupertinoIcons.chat_bubble_text),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: CupertinoButton.filled(
                                    child: Text("Save"),
                                    onPressed: () {
                                      settingprovider.settingxFile =
                                          settingprovider.settingxFile;
                                      settingprovider.settingname =
                                          settingprovider.nameController.text;
                                      settingprovider.settingbio =
                                          settingprovider.bioController.text;
                                      settingprovider.setsettingdata();
                                      print(settingprovider.settingname);
                                      print(settingprovider.settingxFile);
                                      settingprovider.refresh();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: CupertinoButton.filled(
                                    child: Text("Clear"),
                                    onPressed: () {
                                      settingprovider.clear();
                                      settingprovider.textformfieldclear();
                                      settingprovider.refresh();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            Container(
              margin: EdgeInsets.only(top: 2),
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 1,
              color: Colors.grey,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(CupertinoIcons.sun_max)),
                      Padding(
                        padding: const EdgeInsets.only(top: 17, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Theme",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              "Change Theme",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Consumer<ThemeProvider>(
                    builder: (context, themeprovider, child) {
                      return   Positioned(
                        top: 22,
                        right: 15,
                        child: CupertinoSwitch(
                          value: themeprovider.currentTheme,
                          onChanged: (value) {
                            themeprovider.changeTheme(value);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
