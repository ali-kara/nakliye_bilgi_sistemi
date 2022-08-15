import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/map_screen.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';
import 'package:nakliye_bilgi_sistemi/location.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: ListView(shrinkWrap: true, // ortalamayı saglıyor
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
                            builder: (context) => const LocationScreen()));
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
                  child: const MyListItem(
                    title: 'Location',
                    icon: Icons.location_city,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationScreen()));
                  },
                  child: const MyListItem(
                    title: 'Barcode',
                    icon: Icons.qr_code_scanner,
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
      margin: const EdgeInsets.all(5),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue[500]),
      child: Center(
        child: ListTile(
          selectedColor: Colors.white,
          leading: const FlutterLogo(),
          trailing: Icon(
            icon,
            size: 50,
            color: Colors.deepOrange,
          ),
          title: Text(
            title.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, this.icon, this.title}) : super(key: key);

  final IconData? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.amberAccent,
        height: 100,
        child: Row(
          children: [
            const FlutterLogo(),
            Icon(
              icon,
              size: 50,
              color: Colors.deepOrange,
            ),
            Text(
              title.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
