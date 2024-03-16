// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Managers/shared_prefences.dart';
import 'package:nakliye_bilgi_sistemi/Managers/sofor_manager.dart';
import 'package:nakliye_bilgi_sistemi/Model/bolge.dart';
import 'package:nakliye_bilgi_sistemi/Model/arac_plaka.dart';
import 'package:nakliye_bilgi_sistemi/Screens/login_screen.dart';
import 'package:nakliye_bilgi_sistemi/Screens/main_screen.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/loading_view.dart';

class GirisBilgi extends StatefulWidget {
  const GirisBilgi({super.key});

  @override
  State<GirisBilgi> createState() => _GirisBilgiState();
}

class _GirisBilgiState extends State<GirisBilgi> with NavigatorManager {
  List<AracPlaka>? _plakalar;
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

    String? pp = await SoforManager.plaka;
    String? bb = await SoforManager.bolge;

    if (pp != null) {
      AracPlaka? p = _plakalar
          ?.where((element) => element.plaka?.toUpperCase() == pp)
          .first;
      if (p != null) {
        selectedValuePlaka = p.plakaId;
      }
    }

    if (bb != null) {
      Bolge? b = _bolgeler
          ?.where((element) => element.bolgeAdi?.toUpperCase() == bb)
          .first;

      if (b != null) {
        selectedValueBolge = b.bolgeId;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _plakalar == null ? loadingWidget() : plakaList(),
            const SizedBox(height: 50),
            _bolgeler == null ? loadingWidget() : bolgeList(),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () async {
                navigateToWidgetReplace(
                  context,
                  const MainScreen(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:
                      (selectedValueBolge != null && selectedValuePlaka != null)
                          ? const Text(
                              'Kaydet',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : FittedBox(
                              child: loadingWidget(),
                            ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () async {
                await BaseSharedPreferences.clear();

                if (!mounted) {
                  return;
                }

                navigateToWidgetReplace(
                  context,
                  const LoginPage(),
                );
              },
              child: const Text('Çıkış Yap'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> plakaGetir() async {
    var res = await _girisService.getPlaka();

    setState(() {
      if (mounted) {
        _plakalar = res;
      }
    });
  }

  Future<void> bolgeGetir() async {
    var res = await _girisService.getBolge();

    setState(() {
      if (mounted) {
        _bolgeler = res;
      }
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
              value: plaka.plakaId,
              child: Text(plaka.plaka.toString()),
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
              value: bolge.bolgeId,
              child: Text(bolge.bolgeAdi.toString()),
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
