import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login.dart';
import 'package:nakliye_bilgi_sistemi/Screens/map_screen.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

import '../location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: GridView(
              shrinkWrap: true, // ortalamayı saglıyor
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuDashboardPage()));
                  },
                  child: const MyWidget(
                    title: 'Home',
                    icon: Icons.home,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationScreen()));
                  },
                  child: const MyWidget(
                    title: 'Location',
                    icon: Icons.location_city,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BarcodeScanner()));
                  },
                  child: const MyWidget(
                    title: 'Barcode',
                    icon: Icons.qr_code_scanner,
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MapScreen()));},
                  child: const MyWidget(
                    title: 'Map',
                    icon: Icons.maps_home_work,
                  ),
                ),



                



               
              ]),
              
        ),
          
      ),
      
    );
  }
}

class MyWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;

  const MyWidget({Key? key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.green),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70,
            color: Colors.deepOrange,
          ),
          Text(
            title.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );


  }
}
