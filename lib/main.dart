import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/splash_screen.dart';

import 'Core/init/main_build.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // Exit fullscreen
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return MaterialApp(
      title: 'Nakliye Bilgi Sistemi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.black,
        //primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
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