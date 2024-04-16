import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Managers/sofor_manager.dart';
import 'package:nakliye_bilgi_sistemi/ViewModels/tombala_insert.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/loading_view.dart';

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
                  ? loadingWidget()
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
      bolge: await SoforManager.bolge,
      plaka: await SoforManager.plaka,
      soforKodu: await SoforManager.soforKodu,
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
