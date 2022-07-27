import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Screens/drawer_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

import '../Global/Constants/_colors.dart';
import '../location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(),
      drawer: const drawerScreen(),
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
                    title: 'Barkod İşlemleri',
                    icon: Icons.qr_code,
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const LocationScreen()));
                //   },
                //   child: const MyWidget(
                //     title: 'Location',
                //     icon: Icons.location_city,
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GirisBilgi()));
                  },
                  child: const MyWidget(
                    title: 'Bilgilerim',
                    icon: Icons.info,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationScreen(),
                      ),
                    );
                  },
                  child: const MyWidget(
                    title: 'Konum İşlemleri',
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
