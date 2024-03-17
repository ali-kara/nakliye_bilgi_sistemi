import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nakliye_bilgi_sistemi/Api/app_health_check_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_images.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool requestComplete = false;
  late AppHealthCheckService appHealthService;

  @override
  void initState() {
    super.initState();

    appHealthService = AppHealthCheckService();

    _controller = AnimationController(
      vsync: this,
    );

    checkForConnection();
  }

  showDialog(String Message) {
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
      desc: Message,
      showCloseIcon: false,
      btnOkText: 'Tekrar Dene',
      btnCancelText: 'Kapat',
      btnCancelOnPress: () {
        exit(0);
      },
      btnOkOnPress: () {
        checkForConnection();
      },
    ).show();
  }

  Future<void> checkForConnection() async {
    var response = await appHealthService.getAppHealth(context);

    if (response != null) {
      if (response.isActive != true) {
        showDialog(response.description.toString());
      } else {
        setState(() {
          requestComplete = true;
        });
      }
    }
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
                if (!requestComplete) {
                  _controller.repeat();
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }
              },
            );
        },
      ),
    );
  }
}
