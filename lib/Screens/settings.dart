// import 'package:flutter/material.dart';
// import 'package:settings_ui/settings_ui.dart';

// import '../Snippets/base_appbar.dart';

// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BaseAppBar(),
//       body: SettingsList(
//         //platform: DevicePlatform.web,
//         sections: [
//           SettingsSection(
//             tiles: [
//               SettingsTile(
//                 onPressed: (context) => toNotificationsScreen(context),
//                 title: const Text('Network & internet'),
//                 description: const Text('Mobile, Wi-Fi, hotspot'),
//                 leading: const Icon(Icons.wifi),
//               ),
//               SettingsTile(
//                 onPressed: (context) => toNotificationsScreen(context),
//                 title: const Text('Connected devices'),
//                 description: const Text('Bluetooth, pairing'),
//                 leading: const Icon(Icons.devices_other),
//               ),
//               SettingsTile(
//                 onPressed: (context) => toNotificationsScreen(context),
//                 title: const Text('Apps'),
//                 description: const Text('Assistant, recent apps, default apps'),
//                 leading: const Icon(Icons.apps),
//               ),
//               SettingsTile(
//                 onPressed: (context) => toNotificationsScreen(context),
//                 title: const Text('Notifications'),
//                 description: const Text('Notification history, conversations'),
//                 leading: const Icon(Icons.notifications_none),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void toNotificationsScreen(BuildContext context) {}
// }

import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/widgets/setting_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationEnabled = true;

  void darkModeChange(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void notificationChange(bool value) {
    setState(() {
      isNotificationEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Genel'),
              textColor: Colors.black,
              titleTextStyle: texttStyleHead(),
            ),
            settingsTile(
                'Dark Tema', Icons.dark_mode, isDarkMode, darkModeChange),
            settingsTile(
              'Bildirimler',
              Icons.notifications,
              isNotificationEnabled,
              notificationChange,
            ),
          ],
        ),
      ),
    );
  }
}
