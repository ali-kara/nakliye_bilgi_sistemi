// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:nakliye_bilgi_sistemi/Api/location_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_keys.dart';
import 'package:nakliye_bilgi_sistemi/Model/geo_location.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'dart:async';

abstract class ILocationManager {
  Future<void> StartService();
  void Insert(LocationData location);
  Future<bool> AskForPermission();
}

class LocationManager implements ILocationManager {
  late LocationService _locationService;
  late Location location;

  // late LocationData _locationData;

  // final bool _isListenLocation = false;
  // final bool _isGetLocation = false;

  LocationManager(LocationService locationService) {
    _locationService = locationService;
    location = Location();

    // location.changeSettings(interval: 10000, distanceFilter: 1);

    location.changeNotificationOptions(
      title: 'Arka Planda Çalışmaya devam ediyor',
    );
    location.enableBackgroundMode(enable: true);
  }
  Future<void> GetDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    final SnackBar snackBar = SnackBar(
      content: Text(androidInfo.model + " " + androidInfo.id),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          //showSnackbar(context, color, "sadasd");
        },
        textColor: Colors.white,
      ),
      showCloseIcon: true,
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void SendLocation() {
    Timer.periodic(Duration(seconds: 10), (timer) async {
      var data = await location.getLocation();

      var model = GeoLocationInsert(
        sofor_Kodu: "ankibo",
        latitude: data.latitude,
        longitude: data.longitude,
      );

      _locationService.insert(model);

      final SnackBar snackBar = SnackBar(
        content: Text(model.toJson().toString() + " gönderildi"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            //showSnackbar(context, color, "sadasd");
          },
          textColor: Colors.white,
        ),
        showCloseIcon: true,
      );
      snackbarKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Future<void> StartService() async {
    bool res = await AskForPermission();
    if (res) {
      // ShowDebug.print('Servis başlatıldı.');

      //SendLocation();
      await GetDeviceInfo();
      print('Servis Baslatıldı');

      final SnackBar snackBar = SnackBar(
        content: Text("Servis Baslatıldı"),
        backgroundColor: Colors.white,
        showCloseIcon: true,
      );
      snackbarKey.currentState?.showSnackBar(snackBar);

      // location.onLocationChanged.listen((LocationData currentLocation) {
      //   Insert(currentLocation);

      //   // WidgetsBinding.instance.addObserver(newMethod(currentLocation));

      //   if (kDebugMode) {
      //     print(currentLocation.toString());
      //   }
      // });
    }
  }

  @override
  void Insert(LocationData location) {
    var model = GeoLocationInsert(
      sofor_Kodu: "ankibo",
      latitude: location.latitude,
      longitude: location.longitude,
    );

    var response = _locationService.insert(model);
    // if (!response.success) {
    //   //alert(context, response.message ?? "");
    // }
  }

  @override
  Future<bool> AskForPermission() async {
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();

      if (serviceEnabled) return true;
    }

    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) return true;
    }

    return true;
  }
}
