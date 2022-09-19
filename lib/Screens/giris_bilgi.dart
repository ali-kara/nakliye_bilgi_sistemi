// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Managers/shared_prefences.dart';
import 'package:nakliye_bilgi_sistemi/Model/bolge.dart';
import 'package:nakliye_bilgi_sistemi/Model/plaka.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/main_screen.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/loading_view.dart';

class GirisBilgi extends StatefulWidget {
  const GirisBilgi({Key? key}) : super(key: key);

  @override
  State<GirisBilgi> createState() => _GirisBilgiState();
}

class _GirisBilgiState extends State<GirisBilgi> with NavigatorManager {
  List<Plaka>? _plakalar;
  List<Bolge>? _bolgeler;

  var selectedValueBolge;
  var selectedValuePlaka;

  late final IGirisEkraniService _girisService;

  @override
  void initState() {
    super.initState();

    _girisService = GirisEkraniServis();
    init();
  }

  Future<void> init() async {
    await plakaGetir();
    await bolgeGetir();

    Bolge? b = _bolgeler
        ?.where((element) => element.BolgeAdi?.toUpperCase() == "SAMSUN")
        .first;
    Plaka? p = _plakalar
        ?.where((element) => element.PlakaAdi?.toUpperCase() == "07FTM84")
        .first;

    if (b != null) {
      selectedValueBolge = b.BolgeId;
    }
    if (p != null) {
      selectedValuePlaka = p.PlakaId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _plakalar == null ? loadingWidget() : plakaList(),
            const SizedBox(height: 50),
            _bolgeler == null ? loadingWidget() : bolgeList(),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child:
                    (selectedValueBolge != null && selectedValuePlaka != null)
                        ? InkWell(
                            onTap: () async {
                              navigateToWidgetReplace(
                                context,
                                const MainScreen(),
                              );
                            },
                            child: const Text(
                              'Kaydet',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : loadingWidget(),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () async {
                  await HelperFunctions.saveUserLoggedInStatus(false);
                  await HelperFunctions.saveUserNameSF("");

                  if (!mounted) return;

                  navigateToWidgetReplace(
                    context,
                    const LoginPage(),
                  );
                },
                child: const Text('Çıkış Yap'))
          ],
        ),
      ),
    );
  }

  Future<void> plakaGetir() async {
    var res = await _girisService.getPlaka();

    setState(() {
      _plakalar = res;
    });
  }

  Future<void> bolgeGetir() async {
    var res = await _girisService.getBolge();

    setState(() {
      _bolgeler = res;
    });
  }

  Widget plakaList() {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.blue,
        shape: StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
        ),
        child: DropdownButton(
          hint: const Text(
            "Plaka Seçiniz",
          ),
          isExpanded: true,
          value: selectedValuePlaka,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black87,
          ),
          items: _plakalar?.map((plaka) {
            return DropdownMenuItem(
              value: plaka.PlakaId,
              child: Text(plaka.PlakaAdi.toString()),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValuePlaka = value;
            });
          },
        ),
      ),
    );
  }

  Widget bolgeList() {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.blue,
        shape: StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
        ),
        child: DropdownButton(
          hint: const Text("Bölge Seçiniz"),
          isExpanded: true,
          value: selectedValueBolge,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black87,
          ),
          items: _bolgeler?.map((bolge) {
            return DropdownMenuItem(
              value: bolge.BolgeId,
              child: Text(bolge.BolgeAdi.toString()),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValueBolge = value;
            });
          },
        ),
      ),
    );
  }
}
