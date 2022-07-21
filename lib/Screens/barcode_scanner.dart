import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Global/utils/alert.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala_insert.dart';

class Cameraaa {
  Future<void> Scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Vazgeç", true, ScanMode.BARCODE)
        .then((value) => value);
  }
  // FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //         '#ff6666', 'Vazgeç', true, ScanMode.BARCODE)!
  //     .listen((value) => setState(() => _data = value));
}

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String _data = "";
  String _data2 = "";

  @override
  void initState() {
    super.initState();
  }

  _insert() async {
    alert(context, _data);
  }

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Vazgeç", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));

    _insert();
    // FlutterBarcodeScanner.getBarcodeStreamReceiver(
    //         '#ff6666', 'Vazgeç', true, ScanMode.BARCODE)!
    //     .listen((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarcodeInsert(),
                const SizedBox(height: 100),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () => _scan(),
                    child: const Text(
                      'Barkod Tara',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Text(_data),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarcodeInsert extends StatefulWidget {
  BarcodeInsert({Key? key}) : super(key: key);

  @override
  State<BarcodeInsert> createState() => _BarcodeInsertState();
}

class _BarcodeInsertState extends State<BarcodeInsert> {
  final ureticiKoduController = TextEditingController();

  final adetController = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                controller: ureticiKoduController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Üretici Kodu',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                controller: adetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Adet',
                  //labelText: "Password"
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blue[700],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: !isLoading
                  ? InkWell(
                      onTap: () async {
                        _changeLoading();
                        _insert();
                        _changeLoading();
                      },
                      child: const Text(
                        'Koli Kaydet',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ],
    );
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _insert() async {
    TombalaInsert tombalaInsert = TombalaInsert();
    tombalaInsert.adet = adetController.text;
    tombalaInsert.ureticiKodu = ureticiKoduController.text;
    tombalaInsert.bolge = "İZMİR";
    tombalaInsert.plaka = "35AP0635";
    tombalaInsert.soforKodu = "ANKİBO";

    var service = TombalaService();
    var response = await service.insert(tombalaInsert);
    if (response) {
      alert(context, "Başarılı");
    } else {
      alert(context, "Hata");
    }
  }
}
