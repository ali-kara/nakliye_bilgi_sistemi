import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nakliye_bilgi_sistemi/Api/app_health_check_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_images.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AppHealthCheckService appHealthService;

  bool appAvailable = false;
  bool noForcedUpdate = false;

  @override
  void initState() {
    super.initState();

    appHealthService = AppHealthCheckService();

    _controller = AnimationController(
      vsync: this,
    );

    checkForConnection();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  showDialog(String message, {String okMessage = "Tekrar Dene"}) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 2,
      ),
      width: MediaQuery.of(context).size.width,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Dismissed by $type'),
        //   ),
        // );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Bilgi',
      desc: message,
      showCloseIcon: false,
      btnOkText: okMessage,
      btnCancelText: 'Kapat',
      btnCancelOnPress: () {
        exit(0);
      },
      btnOkOnPress: () {
        checkForConnection();
      },
    ).show();
  }

  showDialog2(String message, {String okMessage = "Tekrar Dene"}) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 2,
      ),
      width: MediaQuery.of(context).size.width,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Dismissed by $type'),
        //   ),
        // );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Bilgi',
      desc: message,
      showCloseIcon: false,
      btnOkText: okMessage,
      btnCancelText: 'Kapat',
      btnCancelOnPress: () {
        exit(0);
      },
      btnOkOnPress: () async {
        final Uri url = Uri.parse('https://flutter.dev');
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        } else {
          checkForConnection();
        }
      },
    ).show();
  }

  void checkForNavigation() {
    if (appAvailable && noForcedUpdate) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  Future<void> checkForAppVersion() async {
    var response = await appHealthService.checkAppVersion(context);
    if (response != null) {
      if (response.data?.isForcedUpdate == true) {
        showDialog2(response.message.toString(), okMessage: 'Güncelle');
      } else {
        setState(() {
          noForcedUpdate = true;
        });
      }
    }
  }

  Future<void> checkAppAvailability() async {
    var response = await appHealthService.getAppHealth(context);
    if (response != null) {
      if (response.isActive == true) {
        setState(() {
          appAvailable = true;
        });
      } else {
        showDialog(response.description.toString());
      }
    }
  }

  Future<void> checkForConnection() async {
    await checkAppAvailability();
    await checkForAppVersion();

    checkForNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        GIRIS_ANIMASYON,
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(
              () {
                _controller.repeat();
              },
            );
        },
      ),
    );
  }
}
