import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Managers/location_manager.dart';
import 'package:nakliye_bilgi_sistemi/Managers/shared_prefences.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';
import 'package:nakliye_bilgi_sistemi/widgets/setting_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isAutoLocationSendEnabled = true;

  @override
  void initState() {
    super.initState();

    initSettings();
  }

  initSettings() async {
    var boole = await BaseSharedPreferences.getBool("AUTO_LOCATION_SEND");
    if (boole != null) {
      setState(() {
        isAutoLocationSendEnabled = boole;
      });
    }
  }

  void darkModeChange(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void notificationChange(bool value) {
    setState(() {
      isAutoLocationSendEnabled = value;

      if (value) {
        LocationManager().StartService();
      } else {
        LocationManager().StopService();
      }

      BaseSharedPreferences.saveBool("AUTO_LOCATION_SEND", value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Ayarlar',
        showSettings: false,
      ),
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
              'Otomatik Konum Gönderimi',
              Icons.notifications,
              isAutoLocationSendEnabled,
              notificationChange,
            ),
          ],
        ),
      ),
    );
  }
}
