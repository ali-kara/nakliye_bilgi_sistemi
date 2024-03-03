import 'dart:async';

import "package:flutter/material.dart";
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_state.dart';
import 'package:nakliye_bilgi_sistemi/ViewModels/tombala_insert.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/loading_view.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends BaseState<BarcodeScanner> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarcodeInsert(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarcodeInsert extends StatefulWidget {
  const BarcodeInsert({super.key});

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
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: isLoading
                  ? const FittedBox(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : GestureDetector(
                      onTap: () async {
                        _changeLoading();
                        await _insert();
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
                    ),
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
    TombalaInsert tombalaInsert = TombalaInsert(
      adet: adetController.text,
      ureticiKodu: ureticiKoduController.text,
      bolge: "İZMİR",
      plaka: "06CFM475",
      soforKodu: "ANKİBO",
      barkod: "",
    );

    var service = TombalaService();
    var response = await service.insert(tombalaInsert, context);
    if (!mounted) return;
    if (response) {
      showSnackbarSuccess(context, "Başarılı");
    } else {
      showSnackbarError(context, "Hata");
    }
  }
}
