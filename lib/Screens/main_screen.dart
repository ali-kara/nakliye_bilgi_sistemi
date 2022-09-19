import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner_controller.dart';
import 'package:nakliye_bilgi_sistemi/Screens/dashboard_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Screens/map_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/tombala_listesi.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with NavigatorManager {
  _MainScreenState();

  int selectedpage = 0;
  final _pageNo = [
    const DashboardScreen(),
    const MapScreen(),
    const BarcodeScannerWithController(),
    TombalaListesi(),
    const GirisBilgi()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Ana Ekran'),
          TabItem(icon: Icons.map, title: 'Harita'),
          TabItem(
              icon: Icons.camera_alt_outlined,
              title: 'Kamera',
              isIconBlend: false),
          TabItem(icon: Icons.info_outline, title: 'Liste'),
          TabItem(icon: Icons.people, title: 'Profil'),
        ],

        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) {
          setState(() {
            selectedpage = i;
          });
        },
      ),
    );
  }
}
