// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:nakliye_bilgi_sistemi/Api/location_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_keys.dart';
import 'package:nakliye_bilgi_sistemi/Managers/shared_prefences.dart';
import 'package:nakliye_bilgi_sistemi/Managers/sofor_manager.dart';
import 'package:nakliye_bilgi_sistemi/Model/device_model.dart';
import 'package:nakliye_bilgi_sistemi/Model/geo_location.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'dart:async';

// import 'package:permission_handler/permission_handler.dart';

abstract class ILocationManager {
  Future<void> StartService();
  Future<void> StopService();
  void Insert(LocationData location);
  Future<bool> AskForPermission();
}

class LocationManager implements ILocationManager {
  late LocationService _locationService;
  late Location location;
  static late Timer timerPeriodic;
  static bool isPeriodicSendEnabled = false;
  static late DeviceModel deviceModel;

  LocationManager() {
    _locationService = LocationService();
    location = Location();

    // location.changeSettings(interval: 10000, distanceFilter: 1);

    location.changeNotificationOptions(
      title: 'Arka Planda Çalışmaya devam ediyor',
    );
    location.enableBackgroundMode(enable: true);
  }

  Future<void> GetDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    deviceModel = DeviceModel();
    var info;
    if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfo.iosInfo;
      deviceModel.model = info.model;
      deviceModel.serialNo = info.identifierForVendor;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      deviceModel.model = info.model;
      deviceModel.serialNo = info.serialNumber;
    }

    inspect(info);
  }

  void SendLocation() {
    timerPeriodic = Timer.periodic(
      const Duration(seconds: 10),
      (timer) async {
        var data = await location.getLocation();

        var model = GeoLocationInsert(
          soforKodu: await SoforManager.soforKodu,
          soforSessionId: await SoforManager.sessionId,
          latitude: data.latitude,
          longitude: data.longitude,
        );

        _locationService.insert(model);

        if (isPeriodicSendEnabled == false) {
          timer.cancel();
        }

        final SnackBar snackBar = SnackBar(
          content: Text("${model.toJson()} gönderildi"),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {
              //showSnackbar(context, color, "sadasd");
            },
            textColor: Colors.white,
          ),
          showCloseIcon: false,
        );
        snackbarKey.currentState?.showSnackBar(snackBar);
      },
    );
  }

  @override
  Future<void> StopService() async {
    isPeriodicSendEnabled = false;
    timerPeriodic.cancel();
  }

  @override
  Future<void> StartService() async {
    var boole = await BaseSharedPreferences.getBool("AUTO_LOCATION_SEND");
    if (boole != null && boole) {
      bool res = await AskForPermission();
      if (res) {
        debugPrint('Servis Başlatıldı.');

        isPeriodicSendEnabled = true;
        SendLocation();
        await GetDeviceInfo();

        location.onLocationChanged.listen((LocationData currentLocation) {
          Insert(currentLocation);

          // WidgetsBinding.instance.addObserver(newMethod(currentLocation));

          if (kDebugMode) {
            print(currentLocation.toString());
          }
        });
      }
    }
  }

  @override
  Future<void> Insert(LocationData location) async {
    var model = GeoLocationInsert(
      soforKodu: await SoforManager.soforKodu,
      latitude: location.latitude,
      longitude: location.longitude,
    );

    _locationService.insert(model);
  }

  @override
  Future<bool> AskForPermission() async {
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted != PermissionStatus.granted) {
      return true;
    } else if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    return true;
  }

  // Future<void> _checkLocationPermission() async {
  //   final status = await Permission.location.status;
  //   if (status.isDenied) {
  //     final bool isPermanentlyDenied =
  //         await Permission.location.isPermanentlyDenied;
  //     if (isPermanentlyDenied) {
  //       _showPermissionDialog();
  //     } else {
  //       await Permission.location.request();
  //       _checkLocationPermission(); // Check permission again after request
  //     }
  //   } else if (status.isGranted) {
  //     // Permission is granted, proceed with location functionality
  //     _getCurrentLocation();
  //   }
  // }

  // void _showPermissionDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Location Permission Required'),
  //         content: Text(
  //             'Please enable location permissions in settings to use this feature.'),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Open Settings'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               openAppSettings(); // Open app settings
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
