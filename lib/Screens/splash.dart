import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen(),)));
  }

  @override
  Widget build(BuildContext context) {
    return  
    Container(
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          //fit: BoxFit.fill,
          
        ),
        shape: BoxShape.circle,
      ),
    );

    //FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}