import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/ViewModels/tombala_insert.dart';

class BarcodeScannerWithoutController extends StatefulWidget {
  const BarcodeScannerWithoutController({super.key});

  @override
  BarcodeScannerWithoutControllerState createState() =>
      BarcodeScannerWithoutControllerState();
}

class BarcodeScannerWithoutControllerState
    extends State<BarcodeScannerWithoutController>
    with SingleTickerProviderStateMixin {
  String? barcode;
  late TombalaService service;
  @override
  void initState() {
    super.initState();

    service = TombalaService();
  }

  Future<void> _insert(String barkod) async {
    TombalaInsert tombalaInsert = TombalaInsert(
        adet: "1",
        ureticiKodu: "",
        bolge: "ANKARA",
        plaka: "06CFM475",
        soforKodu: "ANKİBO",
        barkod: barkod);

    /*
    Barkodda
İlk 5 hane FLORA
6. karakter - 
7 tür (1,0)
8 karakter - 
9,10,11,12 karakter üretici kodu */

    var response = await service.insert(tombalaInsert, context);
    if (!mounted) return;
    if (response) {
      showSnackbarSuccess(context, "$barkod Başarılı");
    } else {
      showSnackbarError(context, "Hata");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                fit: BoxFit.contain,
                //allowDuplicates: false,
                onDetect: (barcode) {
                  setState(() {
                    this.barcode = barcode.barcodes.first.rawValue;

                    _insert(this.barcode ?? "");
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: Colors.black.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          height: 50,
                          child: FittedBox(
                            child: Text(
                              barcode ?? 'Scan something!',
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
