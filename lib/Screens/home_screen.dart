import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Screens/map_screen.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

import '../Global/Constants/_colors.dart';
import '../location.dart';
import 'list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(),
      endDrawer: Drawer(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Merhaba',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Merhaba',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            InkWell(
              child: Text(
                'Merhaba',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Merhaba',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Merhaba',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )),
      body: Container(
        color: BACKGROUND_COLOR,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BarcodeScanner()));
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GirisBilgi()));
                  },
                  child: const MyWidget(
                    title: 'Barcode',
                    icon: Icons.qr_code_scanner,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                  },
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
          borderRadius: BorderRadius.circular(20), color: ANA_MENU_BUTONLAR),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70,
            color: ANA_MENU_BUTONLAR_ICI,
          ),
          Text(
            title.toString(),
            style: const TextStyle(color: ANA_MENU_BUTONLAR_ICI, fontSize: 22),
          )
        ],
      ),
    );
  }
}
