import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/setting_provider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
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
          return Column(
            children: [
              settingprovider.isSetting == false
                  ? Stack(
                      children: [
                        Container(
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
                                padding:
                                    const EdgeInsets.only(top: 17, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      settingprovider.settingname != null
                                          ? "${settingprovider.settingname}"
                                          : "Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      settingprovider.settingbio != null
                                          ? "${settingprovider.settingbio}"
                                          : "Update Profile Data",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 22,
                          right: 15,
                          child: Switch(
                            value: settingprovider.isSetting,
                            onChanged: (value) {
                              settingprovider.changesetting();
                            },
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.4,
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
                                    child: InkWell(
                                      onTap: () {
                                        settingprovider.pickImage();
                                      },
                                      child: CircleAvatar(
                                        maxRadius: 35,
                                        backgroundImage:
                                            settingprovider.settingxFile != null
                                                ? FileImage(
                                                    File(settingprovider
                                                            .settingxFile
                                                            ?.path ??
                                                        ""),
                                                  )
                                                : null,
                                        child: settingprovider.settingxFile ==
                                                null
                                            ? Icon(Icons.add_a_photo_outlined)
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
                                          settingprovider.settingname != null
                                              ? "${settingprovider.settingname}"
                                              : "Profile",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          settingprovider.settingbio != null
                                              ? "${settingprovider.settingbio}"
                                              : "Update Profile Data",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 20, right: 20),
                                child: TextFormField(
                                  controller: settingprovider.nameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "Enter your name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 20, right: 20),
                                child: TextFormField(
                                  controller: settingprovider.bioController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your Bio",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        settingprovider.settingxFile =
                                            settingprovider.settingxFile;
                                        settingprovider.settingname =
                                            settingprovider.nameController.text;
                                        settingprovider.settingbio =
                                            settingprovider.bioController.text;
                                        print(settingprovider.settingname);
                                        print(settingprovider.settingxFile);
                                        settingprovider.refresh();
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        settingprovider.clear();
                                        settingprovider.textformfieldclear();
                                        settingprovider.refresh();
                                      },
                                      child: Text(
                                        "Clear",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 22,
                          right: 15,
                          child: Switch(
                            value: settingprovider.isSetting,
                            onChanged: (value) {
                              settingprovider.changesetting();
                            },
                          ),
                        ),
                      ],
                    ),
              Container(
                margin: EdgeInsets.only(top: 2),
                height: MediaQuery.sizeOf(context).height * 0.1,
                width: MediaQuery.sizeOf(context).width * 1,
                color: Colors.black26,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Theme",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220),
                      child: Consumer<ThemeProvider>(
                        builder: (context,themeprovider,child) {
                          return DropdownButton(
                            value: themeprovider.currentTheme,
                            items: [
                              DropdownMenuItem(
                                child: Text("Light"),
                                value: 'light',
                              ),
                              DropdownMenuItem(
                                child: Text("Dark"),
                                value: 'dark',
                              ),
                              DropdownMenuItem(
                                child: Text("System"),
                                value: 'system',
                              ),
                            ],
                            onChanged: (String? value) {
                              themeprovider.changeTheme(value ?? 'system');
                            },
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
