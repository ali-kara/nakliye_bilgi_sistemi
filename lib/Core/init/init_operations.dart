import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nakliye_bilgi_sistemi/Api/location_service.dart';
import 'package:nakliye_bilgi_sistemi/Managers/location_manager.dart';

void initOperations() {
  initLocationService();
  initHiveService();
}

initLocationService() {
  if (!kIsWeb) {
    LocationManager(LocationService()).StartService();
  }
}

Future<void> initHiveService() async {
  await Hive.initFlutter();
}
