import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationState();
}

class _LocationState extends State<LocationScreen> {
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  bool _isListenLocation = false, _isGetLocation = false;

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
                  _serviceEnabled = await location.serviceEnabled();
                  if (!_serviceEnabled) {
                    _serviceEnabled = await location.requestService();

                    if (_serviceEnabled) return;
                  }

                  _permissionGranted = await location.hasPermission();
                  if (_permissionGranted == PermissionStatus.denied) {
                    _permissionGranted = await location.requestPermission();

                    if (_permissionGranted != PermissionStatus.granted) return;
                  }

                  _locationData = await location.getLocation();

                  setState(() {
                    _isGetLocation = true;
                  });
                },
                child: const Text('Get Location')),
            _isGetLocation
                ? Text(
                    'Location: ${_locationData.latitude}/${_locationData.longitude}')
                : Container(),
            ElevatedButton(
              onPressed: () async {
                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  _serviceEnabled = await location.requestService();

                  if (_serviceEnabled) return;
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();

                  if (_permissionGranted != PermissionStatus.granted) return;
                }
              },
              child: const Text('Live Location')),
              StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.waiting) {
                    var data = snapshot.data as LocationData;
                    return Text(
                        'Location Always Change:\n ${data.latitude}/${data.longitude}');
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Message(
      String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
