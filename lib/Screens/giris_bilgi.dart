import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Model/plaka.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';

import '../Global/Api/giris_bilgi.dart';

class GirisBilgi extends StatefulWidget {
  GirisBilgi({Key? key}) : super(key: key);

  @override
  State<GirisBilgi> createState() => _GirisBilgiState();
}

class _GirisBilgiState extends State<GirisBilgi> {
  var listPlaka;
  late String selected;

  @override
  void initState() {
    super.initState();

    PlakaGetir();
  }

  PlakaGetir() async {
    final girisEkraniServis girisBilgi = girisEkraniServis();
    var list = girisBilgi.getPlaka();
    setState(() {
      listPlaka = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // FutureBuilder(
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       DropdownButton(
          //           items: listPlaka.map((Plaka plaka) {
          //             return DropdownMenuItem<String>(
          //               value: plaka.PlakaId.toString(),
          //               child: Text(plaka.PlakaAdi),
          //             );
          //           }).toList(),
          //           style: const TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 20,
          //           ),
          //           onChanged: null);
          //     } else {
          //       return const CircularProgressIndicator();
          //     }
          //   },
          //   future: PlakaGetir(),
          // ),

          DropdownButton(
              items: listPlaka.map((Plaka plaka) {
                DropdownMenuItem<String>(
                  value: plaka.PlakaId.toString(),
                  child: Text(plaka.PlakaAdi),
                );
              }).toList(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              onChanged: null)
        ],
      ),
    );
  }
}
