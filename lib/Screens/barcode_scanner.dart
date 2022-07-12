import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/background.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

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

  _insert() async {}

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
      appBar: const BaseAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () => _scan(),
            child: const Text('Scan Barcode'),
          ),
          Text(_data),
        ],
      ),
    );
  }
}
