import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../Snippets/base_appbar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SettingsList(
        //platform: DevicePlatform.web,
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Network & internet'),
                description: const Text('Mobile, Wi-Fi, hotspot'),
                leading: const Icon(Icons.wifi),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Connected devices'),
                description: const Text('Bluetooth, pairing'),
                leading: const Icon(Icons.devices_other),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Apps'),
                description: const Text('Assistant, recent apps, default apps'),
                leading: const Icon(Icons.apps),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Notifications'),
                description: const Text('Notification history, conversations'),
                leading: const Icon(Icons.notifications_none),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void toNotificationsScreen(BuildContext context) {}
}
