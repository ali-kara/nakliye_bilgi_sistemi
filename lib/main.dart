import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';

import 'package:nakliye_bilgi_sistemi/Core/init/main_build.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Screens/splash_screen.dart';


Location location = Location();

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  await Hive.initFlutter();

  //LocationManager(LocationService()).StartService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // Exit fullscreen
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
      title: 'Nakliye Bilgi Sistemi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: BACKGROUND_COLOR,
        primaryColor: BACKGROUND_COLOR,
      ),
      home: const SplashScreen(),
      builder: MainBuild.build,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
