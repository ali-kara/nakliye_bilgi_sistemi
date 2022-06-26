import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nakliye_bilgi_sistemi/Screens/splash.dart';

import 'Core/init/main_build.dart';

void main() => runApp(MyApp());

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
        primarySwatch: Colors.lightBlue,
      ),
      home: const SplashScreen(),
      builder: MainBuild.build,
    );
  }
}
