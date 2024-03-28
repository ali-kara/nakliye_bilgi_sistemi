import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nakliye_bilgi_sistemi/Managers/location_manager.dart';

Future<void> initOperations() async {
  initLocationService();
  await initHiveService();
}

initLocationService() {
  if (!kIsWeb) {
    LocationManager().StartService();
  }
}

Future<void> initHiveService() async {
  if (!kIsWeb) {
    await Hive.initFlutter();
  }
}
