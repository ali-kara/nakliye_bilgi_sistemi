import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Core/init/init_operations.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Screens/barcode_scanner_controller.dart';
import 'package:nakliye_bilgi_sistemi/Screens/bottom_sheet.dart';
import 'package:nakliye_bilgi_sistemi/Screens/dashboard_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/tombala_listesi.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/custom_gridview.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with NavigatorManager {
  _MainScreenState();

  int selectedpage = 0;
  final _pageNo = kIsWeb
      ? [
          const DashboardScreen(),
          TombalaListesi(),
          const MyBottomSheet(),
        ]
      : [
          const DashboardScreen(),
          TombalaListesi(),
          const BarcodeScannerWithController(),
          // const MapScreen(),
          // const Center(
          //     child: Text('Bu Özellik Yeni Sürümde Eklenecektir.',
          //         style: TextStyle(fontSize: 16))),
          const CustomGridView(),
          const MyBottomSheet()
        ];

  @override
  void initState() {
    super.initState();

    initOperations();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: _pageNo[selectedpage],
          bottomNavigationBar: getConvexAppBar()),
    );
  }

  Widget getConvexAppBar() {
    if (kIsWeb) {
      return ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Ana Ekran',
          ),
          TabItem(
            icon: Icons.info_outline,
            title: 'Liste',
          ),
          TabItem(
            icon: Icons.people,
            title: 'Profil',
          ),
        ],

        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) {
          setState(() {
            selectedpage = i;
          });
        },
      );
    } else {
      return ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Ana Ekran',
          ),
          TabItem(
            icon: Icons.list,
            title: 'Liste',
          ),
          TabItem(
              icon: Icons.camera_alt_outlined,
              title: 'Kamera',
              isIconBlend: false),
          TabItem(
            icon: Icons.location_on,
            title: 'Harita',
            activeIcon: Icons.location_pin,
          ),
          TabItem(
            icon: Icons.people,
            title: 'Profil',
          ),
        ],

        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) {
          setState(() {
            selectedpage = i;
          });
        },
      );
    }
  }
}
