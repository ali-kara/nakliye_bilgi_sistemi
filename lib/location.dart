import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:nakliye_bilgi_sistemi/Api/location_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/show_debug.dart';
import 'package:nakliye_bilgi_sistemi/Managers/location_manager.dart';
import 'package:nakliye_bilgi_sistemi/Model/geo_location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationState();
}

class _LocationState extends State<LocationScreen> {
  Location location = Location();
  late LocationData _locationData;

  // bool _isListenLocation = false;
  bool _isGetLocation = false;

  late LocationService _locationService;

  @override
  void initState() {
    super.initState();

    location.enableBackgroundMode(enable: true);

    _locationService = LocationService();

    _getLocations();
  }

  _insert() async {
    var model = GeoLocationInsert();

    model.sofor_Kodu = "ankibo";
    model.latitude = _locationData.latitude;
    model.longitude = _locationData.longitude;

    var response = await _locationService.insert(model);
    // if (!response.success) {
    //   showSnackbarError(context, response.message ?? "");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                LocationManager(LocationService()).AskForPermission();

                _locationData = await location.getLocation();

                _insert();

                setState(() {
                  _isGetLocation = true;
                });
              },
              child: const Text('Get Location'),
            ),
            _isGetLocation
                ? Text(
                    'Location: ${_locationData.latitude}/${_locationData.longitude}')
                : Container(),
            ElevatedButton(
                onPressed: () async {
                  LocationManager(LocationService()).AskForPermission();
                },
                child: const Text('Live Location')),
            StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.waiting) {
                  _locationData = snapshot.data as LocationData;

                  _insert();

                  return Text(
                    'Location Always Change:\n ${_locationData.latitude}/${_locationData.longitude}',
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              stream: location.onLocationChanged,
            ),
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> message(
      String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<void> _getLocations() async {
    var res = await _locationService.getall();

    ShowDebug.print(res.data);
  }
}
