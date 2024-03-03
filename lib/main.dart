import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';
import 'package:nakliye_bilgi_sistemi/Api/location_service.dart';

import 'package:nakliye_bilgi_sistemi/Core/init/main_build.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
<<<<<<< HEAD
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
=======
import 'package:nakliye_bilgi_sistemi/Managers/location_manager.dart';
import 'package:nakliye_bilgi_sistemi/Screens/splash_screen.dart';
>>>>>>> 4597e3a429432e57a0630429d7e917406a8aeca1

Location location = Location();

const simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";
const rescheduledTaskKey = "be.tramckrijte.workmanagerExample.rescheduledTask";
const failedTaskKey = "be.tramckrijte.workmanagerExample.failedTask";
const simpleDelayedTask = "be.tramckrijte.workmanagerExample.simpleDelayedTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";
const simplePeriodic1HourTask =
    "be.tramckrijte.workmanagerExample.simplePeriodic1HourTask";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await Hive.initFlutter();

<<<<<<< HEAD
  // await Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: true,
  // );

  // //LocationManager(LocationService()).StartService();

  // await Workmanager().registerPeriodicTask(
  //   'asdasdasdasdasdas',
  //   simplePeriodicTask,
  //   initialDelay: Duration(seconds: 2),
  //   frequency: Duration(seconds: 5),
  // );
=======
  LocationManager(LocationService()).StartService();
>>>>>>> 4597e3a429432e57a0630429d7e917406a8aeca1

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print('failed task');

    switch (task) {
      case simpleTaskKey:
        print("$simpleTaskKey was executed. inputData = $inputData");
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("test", true);
        print("Bool from prefs: ${prefs.getBool("test")}");
        break;
      case rescheduledTaskKey:
        final key = inputData!['key']!;
        final prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey('unique-$key')) {
          print('has been running before, task is successful');
          return true;
        } else {
          await prefs.setBool('unique-$key', true);
          print('reschedule task');
          return false;
        }
      case failedTaskKey:
        print('failed task');
        return Future.error('failed');
      case simpleDelayedTask:
        print("$simpleDelayedTask was executed");
        break;
      case simplePeriodicTask:
        print("$simplePeriodicTask was executed");
        break;
      case simplePeriodic1HourTask:
        print("$simplePeriodic1HourTask was executed");
        break;
    }

    return Future.value(false);
  });
}
