import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Model/bolge.dart';
import 'package:nakliye_bilgi_sistemi/Model/plaka.dart';
import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

class GirisBilgi extends StatefulWidget {
  GirisBilgi({Key? key}) : super(key: key);

  @override
  State<GirisBilgi> createState() => _GirisBilgiState();
}

class _GirisBilgiState extends State<GirisBilgi> {
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
      backgroundColor: BACKGROUND_COLOR,
      appBar: const BaseAppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _plakalar == null
                ? const Center(child: CircularProgressIndicator.adaptive())
                : plakaList(),
            const SizedBox(height: 50),
            _bolgeler == null
                ? const Center(child: CircularProgressIndicator.adaptive())
                : bolgeList(),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blue[700],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child:
                    (selectedValueBolge != null && selectedValuePlaka != null)
                        ? InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Koli Kabule Başla',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const CircularProgressIndicator.adaptive(),
              ),
            ),
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
    return DropdownButton(
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
    );
  }

  Widget bolgeList() {
    return DropdownButton(
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
    );
  }
}