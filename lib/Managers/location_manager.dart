// ignore_for_file: non_constant_identifier_names

import 'package:location/location.dart';
import 'package:nakliye_bilgi_sistemi/Api/location_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/show_debug.dart';
import 'package:nakliye_bilgi_sistemi/Model/geo_location.dart';

abstract class ILocationManager {
  Future<void> StartService();
  Future<void> Insert(LocationData location);
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

    location.enableBackgroundMode(enable: true);
  }

  @override
  Future<void> StartService() async {
    bool res = await AskForPermission();
    if (res) {
      ShowDebug.print('Servis başlatıldı.');

      location.onLocationChanged.listen((LocationData currentLocation) {
        Insert(currentLocation);
      });
    }
  }

  @override
  Future<void> Insert(LocationData location) async {
    var model = GeoLocationInsert();

    model.soforKodu = "ankibo";
    model.latitude = location.latitude;
    model.longitude = location.longitude;

    var response = await _locationService.insert(model);
    if (!response.success) {
      //alert(context, response.message ?? "");
    }
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
