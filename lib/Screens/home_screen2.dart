import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/tombala_list.dart';

import 'barcode_scanner2.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _TabLearnState();
}

class _TabLearnState extends State<HomeScreen2> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.qr_code),
            onPressed: () {
              //_tabController.animateTo(_MyTabViews.Home.index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BarcodeScanner2(),
                ),
              );

              // Cameraaa aa = Cameraaa();
              // aa.Scan();
            }),
        bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            shape: const CircularNotchedRectangle(),
            child: _myTabView()),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values
            .map(
              (e) => Tab(
                text: e.name.toUpperCase(),
              ),
            )
            .toList(),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.blue);
  }

  TabBarView _tabbarView() {
    return TabBarView(
        //physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          HomeScreen(),
          TombalaList(),
        ]);
  }
}

enum _MyTabViews { home, settings }
